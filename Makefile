##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## compiles libmy
##

SRC	=	./src/strlen.asm			\
		./src/strchr.asm			\
		./src/strcmp.asm			\
		./src/strncmp.asm			\
		./src/rindex.asm			\
		./src/strcasecmp.asm		\
		./src/memset.asm			\
		./src/memcpy.asm			\
		./src/strl.asm				\
		./src/my_strchr.asm			\
		./src/my_strcmp.asm			\
		./src/my_strncmp.asm		\
		./src/my_rindex.asm			\
		./src/my_strcasecmp.asm		\
		./src/my_memset.asm			\
		./src/my_memcpy.asm			\

CC	=	ld

OBJ	=	$(SRC:.asm=.o)

NAME	=	libasm.so

CFLAGS	=	-Wall -Wextra

ASM	=	nasm -f elf64

all:
	$(ASM) ./src/strlen.asm
	$(ASM) ./src/strchr.asm
	$(ASM) ./src/strcmp.asm
	$(ASM) ./src/strncmp.asm
	$(ASM) ./src/rindex.asm
	$(ASM) ./src/strcasecmp.asm
	$(ASM) ./src/memset.asm
	$(ASM) ./src/memcpy.asm
	$(ASM) ./src/strl.asm
	$(ASM) ./src/my_strchr.asm
	$(ASM) ./src/my_strcmp.asm
	$(ASM) ./src/my_strncmp.asm
	$(ASM) ./src/my_rindex.asm
	$(ASM) ./src/my_strcasecmp.asm
	$(ASM) ./src/my_memset.asm
	$(ASM) ./src/my_memcpy.asm
	$(CC) -shared -fPIC -o $(NAME) $(OBJ)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f *~
	rm -f *#

re:	fclean all

.PHONY: all clean fclean re