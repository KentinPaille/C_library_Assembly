##
## EPITECH PROJECT, 2023
## Minilibc
## File description:
## Makefile
##

AS		= nasm
ASFLAGS		= -f elf64

CC		= ld
CFLAGS		= -fPIC -shared

RM		= rm -f

NAME		= libasm.so

SRCS_DIR	= 	source/
SRCS_FILES	= 	my_strlen.asm \
		  		my_strchr.asm \
				my_memset.asm \
				my_memcpy.asm \
				my_memmove.asm \
				my_strcmp.asm \
				my_strncmp.asm \
				my_strcasecmp.asm \
				my_strrchr.asm \
				my_strstr.asm \
				my_strpbrk.asm \
				my_strcspn.asm

SRCS		= $(addprefix $(SRCS_DIR), $(SRCS_FILES))

OBJS		= $(SRCS:.asm=.o)


all: $(NAME)

$(NAME): $(OBJS)
	 $(CC) $(CFLAGS) -o $(NAME) $(OBJS)

%.o: %.asm
	$(AS) $(ASFLAGS) $< -o $@

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re:	fclean all

.PHONY: all clean fclean re