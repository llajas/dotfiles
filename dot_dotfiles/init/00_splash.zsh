###############################################################################
#  Pokemon art via pokemon-colorscripts (with fallback)                        #
###############################################################################
POKEMON_NAME="lugia"
SHINY_CHANCE=256  # 1 in 256 chance (~0.4%) for shiny variant

# Try to get art from pokemon-colorscripts, fall back to static art
if command -v pokemon-colorscripts >/dev/null 2>&1; then
  # Roll for shiny (like the games!)
  SHINY_ARGS=""
  if (( RANDOM % SHINY_CHANCE == 0 )); then
    SHINY_ARGS="--shiny"
  fi

  # Capture colorscript output into array (preserves ANSI colors)
  POKEMON_ART=()
  while IFS= read -r line; do
    POKEMON_ART+=("$line")
  done < <(pokemon-colorscripts -n "$POKEMON_NAME" --no-title $SHINY_ARGS)
else
  # Fallback: static Lugia art (no pokemon-colorscripts installed)
  POKEMON_ART=(
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣷⣄⠀⠀⠀⢀⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⣿⣿⣿⣿⣿⣷⣄⠀⡜⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢯⡉⠛⠲⠿⣿⣿⣿⣿⣿⣿⣿⡀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⣄⠀⠀⠀⠙⠻⣿⣿⣿⣿⣷⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣽⣦⡀⠀⢰⡆⠈⠙⢿⢿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣦⣤⣭⣬⣥⣀⣾⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣆⢮⣫⣦⠈⠉⠛⠁⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣷⣄⠀⠀⢸⣿⣿⣿⣿⣯⠛⢮⣻⡽⠀⠀⣠⣾⣿⠀⠀⠀⠀⠀⠀⢠⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣦⢸⣿⣿⣿⣿⣿⠀⠀⣨⣭⣥⣾⡿⠟⠉⠀⠀⠀⠀⠀⠀⢸⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣄⡈⠙⠿⡿⢸⣿⣿⣿⣿⣿⣇⣤⣈⠛⠛⠉⢀⣤⣾⣿⠀⠀⠀⠀⠀⠘⣿⣿⢆⡇⣀⣠⣤⡄⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⠗⣠⣾⡞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣌⠻⠿⠋⣁⣤⠀⠀⠀⠀⠀⢻⠟⣾⠇⣿⡿⠋⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣝⠻⠛⠀⠀⠀⠀⠀⢀⣾⣿⠘⠋⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣟⢿⣿⣿⣿⣿⣮⣁⠀⠀⠀⣠⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⠋⢸⣿⢿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠈⠻⣿⣿⣿⣿⣷⣄⡺⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⡿⠁⠀⠸⠇⠀⠈⠛⢿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣦⡙⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⡟⠁⠀⠀⣠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣷⡈⢻⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⠀⢻⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀"
    "⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⢹⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣿⡿⢟⣡⢻⡌⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀"
    "⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠙⠛⠿⣿⣶⡆⠲⢶⣶⣿⣿⣶⣶⢺⣿⣿⣧⠁⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀"
    "⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠈⠉⠉⠀⠘⢿⣟⠟⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀"
    "⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀"
    "⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⢢⠀"
    "⠀⡄⣿⢻⣿⣿⡟⣿⣿⣿⣿⠻⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⠇⣿⣿⣿⣿⡇⣿⣿⣿⡏⣿⣼⡆"
    "⢸⡇⣿⢸⣿⣿⣿⠸⣿⣿⣿⡇⠘⢿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠿⢿⠋⠀⢸⣿⣿⣿⡇⢿⣿⣿⡇⣿⡇⠀"
    "⠈⠃⣿⡼⣿⣿⣿⠀⢿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⠃⢸⣿⣿⠇⠿⠁⠀"
    "⠀⠀⠹⠇⢿⣿⣿⡆⠘⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠟⠀⠸⠿⠛⠀⠀⠀⠀"
    "⠀⠀⠀⠀⠈⠛⠋⠁⠀⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
  )
fi
###############################################################################
#  1. Random flavour line that appears in the dialogue box at the bottom      #
###############################################################################
POKEMON_FLAVOR_LINES=(
  "The winds whisper... Lugia watches silently..."
  "The summit is silent... Only champions ascend here."
  "The waves grow restless... A presence stirs below..."
  "A storm brews outside Mt. Silver..."
  "The stars shimmer faintly... ancient powers await."
  "You're now entering Mt. Silver... A mysterious presence fills the air..."
)
FLAVOR_LINE="${POKEMON_FLAVOR_LINES[RANDOM % ${#POKEMON_FLAVOR_LINES[@]} + 1]}"

###############################################################################
#  Trainer-panel content                                                       #
###############################################################################

# === TRAINER SECTION ===
TRAINER_NAME=$(whoami)

# Trainer ID: Gen VII+ style (6 digits, 0-999999, with leading zeros)
TRAINER_ID=$(printf "%06d" $(( $(echo "$USER@$(hostname)" | cksum | cut -d' ' -f1) % 1000000 )))

# Nature: derived from username hash (25 Pokemon natures)
NATURES=(Hardy Lonely Brave Adamant Naughty Bold Docile Relaxed Impish Lax Timid Hasty Serious Jolly Naive Modest Mild Quiet Bashful Rash Calm Gentle Sassy Careful Quirky)
NATURE_IDX=$(( $(echo "$USER" | cksum | cut -d' ' -f1) % 25 ))
TRAINER_NATURE="${NATURES[$NATURE_IDX]}"

# Region: Johto (based on network search domain + Austin, TX location)
TRAINER_REGION="Johto"

# Current Quest: time-of-day based flavor
HOUR=$(date +%-H)
if (( HOUR >= 0 && HOUR < 6 )); then
  CURRENT_QUEST="Night patrol, Mt. Silver"
elif (( HOUR >= 6 && HOUR < 12 )); then
  CURRENT_QUEST="Training at Victory Road"
elif (( HOUR >= 12 && HOUR < 18 )); then
  CURRENT_QUEST="Challenging Elite Four"
else
  CURRENT_QUEST="Exploring Whirl Islands"
fi

# Helper: truncate string to max length
truncate_str() {
  local str="$1" max="$2"
  if (( ${#str} > max )); then
    echo "${str:0:$((max-1))}…"
  else
    echo "$str"
  fi
}

# === JOURNEY SECTION ===
TRAINER_LOCATION=$(
  loc=$(hostname -f 2>/dev/null || cat /etc/hostname 2>/dev/null || echo "Unknown")
  truncate_str "$loc" 32
)

TRAINER_WEATHER=$(curl -s 'wttr.in/aus+tx?format=%C%20%t' || echo "Unavailable")

# Last Fainted: time since last reboot (party wiped = system restart)
LAST_FAINTED=$(
  if command -v uptime >/dev/null 2>&1 && uptime -s >/dev/null 2>&1; then
    boot_time=$(uptime -s)
    boot_epoch=$(date -d "$boot_time" +%s 2>/dev/null)
    now_epoch=$(date +%s)
    days_ago=$(( (now_epoch - boot_epoch) / 86400 ))
    echo "${days_ago}d ago"
  else
    awk '{print int($1/86400)"d ago"}' /proc/uptime
  fi
)

# === CAMP GEAR SECTION ===
# Party HP: 6 hearts based on RAM availability (like a party of 6 Pokemon)
PARTY_HP=$(
  if command -v free >/dev/null 2>&1; then
    ram_avail_pct=$(free | awk '/^Mem:/ {printf "%d", ($7 * 100 / $2)}')
  elif [[ -f /proc/meminfo ]]; then
    ram_avail_pct=$(awk '/^MemTotal:/{t=$2} /^MemAvailable:/{a=$2} END{printf "%d", (a*100/t)}' /proc/meminfo)
  else
    ram_avail_pct=50
  fi
  # Calculate filled hearts (round to nearest)
  filled=$(( (ram_avail_pct * 6 + 50) / 100 ))
  (( filled > 6 )) && filled=6
  (( filled < 0 )) && filled=0
  empty=$(( 6 - filled ))
  hearts=""
  for ((i=0; i<filled; i++)); do hearts+="♥"; done
  for ((i=0; i<empty; i++)); do hearts+="♡"; done
  echo "$hearts"
)

# PC Boxes: /home disk usage as Pokemon storage boxes (20 boxes total)
PC_BOXES=$(
  disk_info=$(df -h /home 2>/dev/null | awk 'NR==2 {print $3, $2, $5}')
  used=$(echo "$disk_info" | awk '{print $1}')
  total=$(echo "$disk_info" | awk '{print $2}')
  pct=$(echo "$disk_info" | awk '{gsub("%",""); print $3}')
  # Map percentage to box number (1-20)
  box=$(( (pct * 20 + 50) / 100 ))
  (( box < 1 )) && box=1
  (( box > 20 )) && box=20
  echo "Box $box/20 ($used/$total)"
)

# === COMM LINK SECTION ===
COMM_GTS=$(
  gts=$(curl -s --max-time 2 ifconfig.io/host 2>/dev/null || echo "Unknown")
  truncate_str "$gts" 32
)
COMM_LINK_LAN=$(hostname -i 2>/dev/null | awk '{print $1}' || echo "Unavailable")

# Link Quality: ping-based rating
LINK_QUALITY=$(
  ping_ms=$(ping -c1 -W1 8.8.8.8 2>/dev/null | grep -oP 'time=\K[0-9.]+' || echo "999")
  ping_int=${ping_ms%.*}
  if (( ping_int < 30 )); then
    echo "★★★★ Excellent"
  elif (( ping_int < 75 )); then
    echo "★★★☆ Good"
  elif (( ping_int < 150 )); then
    echo "★★☆☆ Fair"
  else
    echo "★☆☆☆ Poor"
  fi
)

# Wild Encounters: active TTY/SSH sessions
WILD_ENCOUNTERS=$(who 2>/dev/null | wc -l | tr -d ' ')

# Wonder Trades: git commits pushed in last 24h across all repos in ~/ghq
WONDER_TRADES=$(
  count=0
  if [[ -d "$HOME/ghq" ]]; then
    while IFS= read -r -d '' gitdir; do
      repo_dir="${gitdir%/.git}"
      commits=$(git -C "$repo_dir" log --all --oneline --since="24 hours ago" 2>/dev/null | wc -l)
      count=$((count + commits))
    done < <(find "$HOME/ghq" -type d -name ".git" -print0 2>/dev/null)
  fi
  echo "$count"
)

# === BUILD THE PANEL ===
TRAINER_INFO=(
  "=== TRAINER ==="
  " ↳ Trainer:       $TRAINER_NAME"
  " ↳ ID No:         $TRAINER_ID"
  " ↳ Nature:        $TRAINER_NATURE"
  " ↳ Region:        $TRAINER_REGION"
  " ↳ Current Quest: $CURRENT_QUEST"

  "=== JOURNEY ==="
  " ↳ Location:      $TRAINER_LOCATION"
  " ↳ Weather:       $TRAINER_WEATHER"
  " ↳ Last Fainted:  $LAST_FAINTED"

  "=== CAMP GEAR ==="
  " ↳ Party HP:      $PARTY_HP"
  " ↳ PC Boxes:      $PC_BOXES"

  "=== COMM LINK ==="
  " ↳ GTS:           $COMM_GTS"
  " ↳ Link (LAN):    $COMM_LINK_LAN"
  " ↳ Link Quality:  $LINK_QUALITY"
  " ↳ Wild Encounters: $WILD_ENCOUNTERS"
  " ↳ Wonder Trades: $WONDER_TRADES (24h)"
)

###############################################################################
#  Build the boxed trainer panel                                              #
###############################################################################
TBOX_W=57
TRAINER_INFO_BOX=( "╔$(printf '═%.0s' $(seq 1 $((TBOX_W-2))))╗" )
for line in "${TRAINER_INFO[@]}"; do
  printf -v row "║ %-*s ║" $((TBOX_W-4)) "$line"
  TRAINER_INFO_BOX+=( "$row" )
done
TRAINER_INFO_BOX+=( "╚$(printf '═%.0s' $(seq 1 $((TBOX_W-2))))╝" )

TBOX_START=0                                  # Art line where panel begins

###############################################################################
#  1)  Print Pokemon art first                                                #
###############################################################################
tput clear
for art_line in "${POKEMON_ART[@]}"; do
  # Print art as-is (pokemon-colorscripts includes ANSI colors)
  printf "%s\n" "$art_line"
done

###############################################################################
#  2)  Over-print the trainer panel at column 62                              #
#      (drawn *after* Pokemon so its bottom border is never overwritten)      #
###############################################################################
# Move cursor up to the panel’s first row
tput cuu $(( ${#POKEMON_ART[@]} - TBOX_START ))

# Draw the boxed rows
for panel_row in "${TRAINER_INFO_BOX[@]}"; do
  printf "\033[62G${BOX_COLOR}%s${RESET_COLOR}\n" "$panel_row"
done

# Move cursor back down to the end of Pokemon art (only if needed)
CURSOR_DOWN=$(( ${#POKEMON_ART[@]} - TBOX_START - ${#TRAINER_INFO_BOX[@]} ))
if (( CURSOR_DOWN > 0 )); then
  tput cud "$CURSOR_DOWN"
fi

###############################################################################
#  3)  Dialogue-style flavour textbox                                         #
###############################################################################
DBOX_W=56
# choose random flavour (defined earlier)
WRAPPED_FLAVOR_LINE=$(echo "$FLAVOR_LINE" | fmt -w $((DBOX_W-4)))

# draw box
printf "${BOX_COLOR}╔"; printf '═%.0s' $(seq 1 $((DBOX_W-2))); printf "╗\n"
while IFS= read -r L; do
  printf "${BOX_COLOR}║ %-*s ║\n" $((DBOX_W-4)) "$L"
done <<< "$WRAPPED_FLAVOR_LINE"
printf "${BOX_COLOR}╚"; printf '═%.0s' $(seq 1 $((DBOX_W-2))); printf "╝\n${RESET_COLOR}\n"
