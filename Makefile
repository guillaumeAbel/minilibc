ASM = nasm
CC = gcc
RM = rm -f
ASFLAGS = -f elf64
LDFLAGS += -shared

NAME = libasm.so

SRC =	memset.asm \
		strchr.asm \
		strcmp.asm \
		strncmp.asm \
		strlen.asm \
		strstr.asm \
		strpbrk.asm \
		memcpy.asm

OBJ = $(SRC:.asm=.o)

%.o : %.asm
		$(ASM) $(ASFLAGS) -o $@ $<

all: $(NAME)

$(NAME): $(OBJ)
		$(CC) $(LDFLAGS) $(OBJ) -o $(NAME)

clean:
		$(RM) $(OBJ)

fclean: clean
		$(RM) $(NAME)

re: fclean all

.PHONY:	all clean fclean re
