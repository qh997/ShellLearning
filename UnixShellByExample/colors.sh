red='\e[0;31m'          # 红色
RED='\e[1;31m'
green='\e[0;32m'        # 绿色
GREEN='\e[1;32m'
yellow='\e[0;33m'       # 黄色
YELLOW='\e[1;33m'
blue='\e[0;34m'         # 蓝色
BLUE='\e[1;34m'
purple='\e[0;35m'       # 紫色
PURPLE='\e[1;35m'
cyan='\e[0;36m'         # 蓝绿色
CYAN='\e[1;36m'
WHITE='\e[1;37m'        # 白色
NC='\e[0m' # 没有颜色

echo -e "${CYAN}This is BASH ${RED}${BASH_VERSION%.*}${CYAN} - DISPLAY on ${RED}$DISPLAY${NC}\n"
echo -e "${RED}RED ${BLUE}BLUE ${cyan}cyan ${GREEN}GREEN${NC}"

# 倒计时
i=10; while (($i >= 0));do sleep 1; echo -en '\r  \r'$i; i=$((i - 1)); done; echo;