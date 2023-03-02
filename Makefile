# This is a minimal set of ANSI/VT100 color codes
_END=$'\033[0m
_BOLD=$'\033[1m
_UNDER=$'\033[4m
_REV=$'\033[7m

# Colors
_GREY=$'\033[30m
_RED=$'\033[31m
_GREEN=$'\033[32m
_YELLOW=$'\033[33m
_BLUE=$'\033[34m
_PURPLE=$'\033[35m
_CYAN=$'\033[36m
_WHITE=$'\033[37m

# Inverted, i.e. colored backgrounds
_IGREY=$'\033[40m
_IRED=$'\033[41m
_IGREEN=$'\033[42m
_IYELLOW=$'\033[43m
_IBLUE=$'\033[44m
_IPURPLE=$'\033[45m
_ICYAN=$'\033[46m
_IWHITE=$'\033[47m

SRCS			=	${addprefix demo1/, \
					machin.c}
NAME			= 	test_demo
RM				= 	rm -rf
CC				=	gcc $(CR_HEADER_PATH) $(CR_LIB_PATH) $(CFLAGS)
CR_HEADER_PATH	=	-I${HOME}/Criterion/include/criterion
CR_LIB_PATH		=	-Wl,-rpath=${HOME}/Criterion/build/src -L${HOME}/Criterion/build/src
CFLAGS			=	-Wall -Werror -Wextra -lcriterion

OBJECTS = $(subst /,/build/,${SRCS:.c=.o})

all:	$(NAME)

${NAME}:	${OBJECTS}
	@echo "${_UNDER}${_RED}Creating binary for tests${_END}"
	@echo "${_BOLD}${_GREEN}${CC} -o ${NAME} ${OBJECTS}${_END}"
	@${CC} -o ${NAME} ${OBJECTS}


${OBJECTS}: $(subst .o,.c,$(subst /build/,/,$@))
	@if [ ! -d "./$(dir $@)" ]; then\
		echo "${_BOLD}${_UNDER}${_BLUE}"mkdir -p $(dir $@)"${_END}";\
		mkdir -p $(dir $@);\
	fi
	@echo "${_BOLD}${_BLUE}"$(CC) -MMD -c $(subst .o,.c,$(subst /build/,/,$@)) -o $@"${_END}"
	@$(CC) -MMD -c $(subst .o,.c,$(subst /build/,/,$@)) -o $@

clean:
	@echo "${_UNDER}${_RED}Deleting Objects and Dependencies${_END}"
	@echo "${_BOLD}${_YELLOW}"${RM} ${OBJECTS} ${DEPEND}"${_END}"
	@${RM} ${OBJECTS} ${DEPEND}
	@echo "${_BOLD}${_YELLOW}"${RM} demo1/build"${_END}"
	@${RM} demo1/build

fclean: clean
	@echo "${_UNDER}${_RED}Deleting Executable${_END}"
	@echo "${_BOLD}${_RED}"${RM} ${NAME}"${_END}"
	@${RM} ${NAME}

re:	fclean all

.PHONY:		all clean fclean re