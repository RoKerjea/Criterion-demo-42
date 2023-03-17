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

################################################################################
#                                VARIABLES									   #
################################################################################

SRCS			=	functions_to_test.c
MAIN_SRCS		=	main.c
NAME			= 	project
RM				= 	rm -rf
CC				=	gcc $(CFLAGS)
CFLAGS			=	-Wall -Werror -Wextra
OBJECTS 		=	$(subst /,/build/,${SRCS:.c=.o})
M_OBJECTS 		=	$(subst /,/build/,${MAIN_SRCS:.c=.o})

################################################################################
#                                MAIN RULES								       #
################################################################################

all:	$(NAME)

${NAME}:	${OBJECTS} ${M_OBJECTS}
	@echo "${_UNDER}${_RED}Creating binary for Project${_END}"
	@echo "${_BOLD}${_GREEN}${CC} -o ${NAME} ${OBJECTS} ${M_OBJECTS}${_END}"
	@${CC} -o ${NAME} ${M_OBJECTS} ${OBJECTS}

${M_OBJECTS}: $(subst .o,.c,$(subst /build/,/,$@))
	@echo "${_BOLD}${_BLUE}"$(CC) -c $(subst .o,.c,$(subst /build/,/,$@)) -o $@"${_END}"
	@$(CC) -c $(subst .o,.c,$(subst /build/,/,$@)) -o $@

${OBJECTS}: $(subst .o,.c,$(subst /build/,/,$@))
	@if [ ! -d "./$(dir $@)" ]; then\
		echo "${_BOLD}${_UNDER}${_BLUE}"mkdir -p $(dir $@)"${_END}";\
		mkdir -p $(dir $@);\
	fi
	@echo "${_BOLD}${_BLUE}"$(CC) -c $(subst .o,.c,$(subst /build/,/,$@)) -o $@"${_END}"
	@$(CC) -c $(subst .o,.c,$(subst /build/,/,$@)) -o $@

################################################################################
#                              	TEST VARIABLES					   		   	   #
################################################################################

CR_HEADER_PATH	=	-I${HOME}/Criterion/include/criterion
T_NAME			= 	test_project
T_SRCS			=	test_functions.c
T_CC			=	gcc $(CR_HEADER_PATH) $(CR_LIB_PATH) $(CFLAGS) $(T_FLAGS)
CR_LIB_PATH		=	-Wl,-rpath=${HOME}/Criterion/build/src -L${HOME}/Criterion/build/src
T_FLAGS			=	-lcriterion
T_OBJECTS 		=	$(subst /,/build/,${T_SRCS:.c=.o})

################################################################################
#                                TEST RULES								       #
################################################################################

${T_OBJECTS}: $(subst .o,.c,$(subst /build/,/,$@))
	@if [ ! -d "./$(dir $@)" ]; then\
		echo "${_BOLD}${_UNDER}${_BLUE}"mkdir -p $(dir $@)"${_END}";\
		mkdir -p $(dir $@);\
	fi
	@echo "${_BOLD}${_BLUE}"$(T_CC) -c $(subst .o,.c,$(subst /build/,/,$@)) -o $@"${_END}"
	@$(T_CC) -c $(subst .o,.c,$(subst /build/,/,$@)) -o $@

tests:	${OBJECTS} ${T_OBJECTS}
	@echo "${_UNDER}${_RED}Creating binary for Tests${_END}"
	@echo "${_BOLD}${_GREEN}${T_CC} -o ${T_NAME} ${OBJECTS} ${T_OBJECTS} ${_END}"
	@${T_CC} -o ${T_NAME} ${OBJECTS} ${T_OBJECTS}
	@./${T_NAME}

################################################################################
#                               	CLEANUP								       #
################################################################################

clean:
	@echo "${_UNDER}${_RED}Deleting Objects and Dependencies${_END}"
	@echo "${_BOLD}${_YELLOW}"${RM} ${OBJECTS} ${M_OBJECTS} ${T_OBJECTS} ${DEPEND}"${_END}"
	@${RM} ${OBJECTS} ${M_OBJECTS} ${T_OBJECTS} ${DEPEND}
	@echo "${_BOLD}${_YELLOW}"${RM} demo1/build"${_END}"
	@${RM} demo1/build

fclean: clean
	@echo "${_UNDER}${_RED}Deleting Executable${_END}"
	@echo "${_BOLD}${_RED}"${RM} ${NAME} ${T_NAME}"${_END}"
	@${RM} ${NAME} ${T_NAME}

re:	fclean all

.PHONY:		all clean fclean re tests