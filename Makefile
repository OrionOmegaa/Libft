.SILENT:

CC = gcc
CFLAGS = -Wall -Wextra -Werror

NAME = libft.a
INCDIR = includes

GREEN = \033[0;32m
YELLOW = \033[0;33m
RESET = \033[0m

SRC =	$/ft_isalpha.c $/ft_isdigit.c $/ft_isalnum.c $/ft_strlen.c $/ft_strncmp.c $/ft_isascii.c \
	$/ft_isprint.c $/ft_memset.c $/ft_bzero.c $/ft_memcpy.c $/ft_memmove.c $/ft_strlcpy.c \
	$/ft_strlcat.c $/ft_toupper.c $/ft_tolower.c $/ft_strchr.c $/ft_strrchr.c $/ft_strncmp.c \
	$/ft_memchr.c $/ft_memcmp.c $/ft_strnstr.c $/ft_atoi.c $/ft_calloc.c $/ft_strdup.c \
	$/ft_substr.c $/ft_strjoin.c $/ft_strtrim.c $/ft_split.c $/ft_itoa.c $/ft_strmapi.c \
	$/ft_striteri.c $/ft_putchar_fd.c $/ft_putstr_fd.c $/ft_putendl_fd.c $/ft_putnbr_fd.c \

OBJ = $(SRC:.c=.o)

BONUS =	$/ft_lstadd_back_bonus.c $/ft_lstadd_front_bonus.c $/ft_lstclear_bonus.c \
	$/ft_lstdelone_bonus.c $/ft_lstiter_bonus.c $/ft_lstlast_bonus.c \
	$/ft_lstmap_bonus.c $/ft_lstnew_bonus.c $/ft_lstsize_bonus.c

BOBJ = $(BONUS:.c=.o)

all: $(NAME)
	@echo "$(GREEN)All Done Succesfully !$(RESET)"

$(NAME): $(OBJ)
	@echo "$(YELLOW)Making Libft.a ...$(RESET)"
	@ar rcs $(NAME) $(OBJ)
	@echo "$(GREEN)Libft.a Done Succesfully !$(RESET)"

bonus: $(OBJ) $(BOBJ)
	@echo "$(YELLOW)Making Libft.a with BONUS ...$(RESET)"
	@ar rcs $(NAME) $(BOBJ)
	@echo "$(GREEN)BONUS Done Succesfully !$(RESET)"
	
%.o: %.c $(INCDIR)/ft.h
	@$(CC) $(CFLAGS) -I $(INCDIR) -c $< -o $@

clean:
	@echo "$(YELLOW)Cleaning object file in progress ...$(RESET)"
	@rm -f $(OBJ) $(BOBJ)
	@echo "$(GREEN)CLEAN Done Succesfully !$(RESET)"

fclean: clean
	@echo "$(YELLOW)Full Clean in progress ...$(RESET)"
	@rm -f $(NAME) $(BOBJ)
	@echo "$(GREEN)FCLEAN Done Succesfully !$(RESET)"
	
re: fclean all
	@echo "$(GREEN)RE Done Succesfully !$(RESET)"

rebonus: fclean bonus
	@echo "$(GREEN)RE of BONUS Done Succesfully !$(RESET)"
.PHONY: all clean fclean re bonus rebonus
