#!/bin/bash

set -eu
set -o pipefail
set -o noclobber

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATES_DIR="$SCRIPT_DIR/templates"
LICENSE_FILE="LICENSE"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_color() {
    echo -e "${1}${2}${NC}"
}

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    print_color $RED "Error: Not in a git repository!"
    exit 1
fi

# Check for uncommitted changes
if ! git diff-index --quiet HEAD --; then
    print_color $RED "Error: You have uncommitted changes. Please commit or stash them first."
    git status --porcelain
    exit 1
fi

# Get author and year
AUTHOR=$(git config user.name)
YEAR=$(date +%Y)

if [ -z "$AUTHOR" ]; then
    print_color $RED "Error: Git user.name not configured. Run: git config user.name 'Your Name'"
    exit 1
fi

# Function to get available licenses
get_licenses() {
    find "$TEMPLATES_DIR" -name "*.tpl" -exec basename {} .tpl \; | sort
}

# Function to select license
select_license() {
    local licenses=($(get_licenses))
    
    if [ ${#licenses[@]} -eq 0 ]; then
        print_color $RED "Error: No license templates found in $TEMPLATES_DIR"
        exit 1
    fi
    
    if command -v fzf > /dev/null 2>&1; then
        # Use fzf if available
        printf '%s\n' "${licenses[@]}" | fzf --prompt "Select license: " --height 40%
    else
        # Fallback to simple menu
        print_color $YELLOW "Available licenses:"
        for i in "${!licenses[@]}"; do
            echo "$((i+1)). ${licenses[$i]}"
        done
        
        while true; do
            echo -n "Select license (1-${#licenses[@]}): "
            read -r selection
            
            if [[ "$selection" =~ ^[0-9]+$ ]] && [ "$selection" -ge 1 ] && [ "$selection" -le "${#licenses[@]}" ]; then
                echo "${licenses[$((selection-1))]}"
                break
            else
                print_color $RED "Invalid selection. Please try again."
            fi
        done
    fi
}

# Function to validate license exists
validate_license() {
    local license=$1
    if [ ! -f "$TEMPLATES_DIR/$license.tpl" ]; then
        print_color $RED "Error: License template '$license.tpl' not found in $TEMPLATES_DIR"
        exit 1
    fi
}

# Function to apply license
apply_license() {
    local license=$1
    local template_path="$TEMPLATES_DIR/$license.tpl"
    
    print_color $YELLOW "Applying $license license..."
    
    # Generate license from smiley template
    sed -e "s/{author}/$AUTHOR/g" -e "s/{year}/$YEAR/g" "$template_path" > "$LICENSE_FILE"
    
    # Commit changes
    git add "$LICENSE_FILE"
    git commit -m "Applied $license license to repo"
    
    print_color $GREEN "✓ Applied $license license (Author: $AUTHOR, Year: $YEAR)"
}

# Main logic
if [ $# -eq 0 ]; then
    # Interactive mode
    LICENSE=$(select_license)
    if [ -n "$LICENSE" ]; then
        validate_license "$LICENSE"
        apply_license "$LICENSE"
    else
        print_color $YELLOW "No license selected."
        exit 0
    fi
elif [ $# -eq 1 ]; then
    # Automatic mode
    LICENSE=$1
    validate_license "$LICENSE"
    apply_license "$LICENSE"
else
    print_color $RED "Usage: $0 [license-name]"
    echo "Examples:"
    echo "  $0           # Interactive mode"
    echo "  $0 mit       # Apply MIT license"
    echo "  $0 apache-2.0 # Apply Apache 2.0 license"
    exit 1
fi
