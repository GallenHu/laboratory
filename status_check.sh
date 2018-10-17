export PATH

# 变量
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[信息]${Font_color_suffix}"
Error="${Red_font_prefix}[错误]${Font_color_suffix}"

# 锐速 centos
serverspeeder1(){
        service serverSpeeder status
}

# 锐速 debian
serverspeeder2(){
        /serverspeeder/bin/serverSpeeder.sh status
}

# 开始
echo -e "
1. 锐速状态centos
2. 锐速状态debian
"
echo && read -e -p "请输入数字 [1-15]：" num
case "$num" in
        1)
        serverspeeder1
        ;;
        2)
        serverspeeder2
        ;;
        *)
        echo -e "${Error} 请输入正确的数字 [1-15]"
        ;;
esac
