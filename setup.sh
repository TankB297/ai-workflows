#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${1:-$HOME/Workspace/AI/ai-workflows}"
SKILLS_DIR="$REPO_DIR/skills"
TARGET_SKILLS_DIR="$HOME/.agents/skills"

usage() {
  cat <<EOF
Usage:
  ./setup.sh [repo_path] [skill_name ...]

Examples:
  ./setup.sh
  ./setup.sh /absolute/path/to/ai-workflows
  ./setup.sh /absolute/path/to/ai-workflows react-implementation-flow
  ./setup.sh /absolute/path/to/ai-workflows react-implementation-flow another-skill

Behavior:
  - If no skill names are provided, all skills under \$REPO_DIR/skills are linked.
  - If one or more skill names are provided, only those skills are linked.
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [ ! -d "$REPO_DIR" ]; then
  echo "Error: repo directory not found: $REPO_DIR"
  exit 1
fi

if [ ! -d "$SKILLS_DIR" ]; then
  echo "Error: skills directory not found: $SKILLS_DIR"
  exit 1
fi

mkdir -p "$TARGET_SKILLS_DIR"

shift_count=0
if [ $# -gt 0 ]; then
  FIRST_ARG="$1"
  if [ -d "$FIRST_ARG" ]; then
    shift
    shift_count=1
  fi
fi

SELECTED_SKILLS=("$@")

discover_all_skills() {
  local dir
  for dir in "$SKILLS_DIR"/*; do
    [ -d "$dir" ] || continue
    [ -f "$dir/SKILL.md" ] || continue
    basename "$dir"
  done
}

link_skill() {
  local skill_name="$1"
  local source_dir="$SKILLS_DIR/$skill_name"
  local target_link="$TARGET_SKILLS_DIR/$skill_name"

  if [ ! -d "$source_dir" ]; then
    echo "Warning: skill directory not found: $source_dir"
    return 1
  fi

  if [ ! -f "$source_dir/SKILL.md" ]; then
    echo "Warning: SKILL.md not found for skill: $skill_name"
    return 1
  fi

  if [ -L "$target_link" ] || [ -e "$target_link" ]; then
    rm -rf "$target_link"
  fi

  ln -s "$source_dir" "$target_link"
  echo "Linked: $skill_name"
  ls -ld "$target_link"
}

echo "Using repo: $REPO_DIR"
echo "Target skill directory: $TARGET_SKILLS_DIR"
echo

if [ ${#SELECTED_SKILLS[@]} -eq 0 ]; then
  mapfile -t SELECTED_SKILLS < <(discover_all_skills)
fi

if [ ${#SELECTED_SKILLS[@]} -eq 0 ]; then
  echo "No skills found to link."
  exit 1
fi

FAILED=0
for skill_name in "${SELECTED_SKILLS[@]}"; do
  echo "Processing: $skill_name"
  if ! link_skill "$skill_name"; then
    FAILED=1
  fi
  echo
done

echo "Final linked skills:"
ls -l "$TARGET_SKILLS_DIR"
echo

if [ "$FAILED" -ne 0 ]; then
  echo "Completed with warnings."
  exit 1
fi

echo "Done."