
NAME	=	cub3D

SRC	=	parser_init.c parser_error.c parser_utils.c parser.c \
			parser_txure_info.c parser_color_info.c parser_map.c \
			parser_map2.c parser_map3.c parser_file.c \
			cub3d.c draw_3D.c draw_2D.c utils_graphics.c colisions.c \
			casting2.c casting.c render.c loop.c initialize.c \
			initialize2.c

OBJS	= $(SRC:.c=.o)

OFILES	= $(addprefix obj/, $(OBJS))

CC		= gcc

FLAGS	= -Wall -Werror -Wextra -g -fsanitize=address

EXTRA	= -framework Cocoa -framework OpenGL -framework IOKit -Iinclude -lglfw -L"/Users/$(USER)/.brew/opt/glfw/lib/"

LIBFT_PATH = libft/libft.a

MLX42_PATH = MLX42/libmlx42.a

HEADERS = -I ./includes

all:	$(NAME)

vpath %.c source/src_parser source/src_errors source/src_graphics source/src_utils

$(OFILES): obj/%.o: %.c
		@mkdir -p obj
		@$(CC) $(FLAGS) -c $< -o $@ $(HEADERS)

$(NAME): $(OFILES) $(LIBFT_PATH) $(MLX42_PATH)
		$(CC) $(FLAGS) $(EXTRA) $(OFILES) $(LIBFT_PATH) $(MLX42_PATH) $(HEADERS) -o $(NAME)
		clear

$(LIBFT_PATH):
		make -C libft all

$(MLX42_PATH):
		make -C MLX42 all

debug: $(LIBFT_PATH) $(MLX42_PATH)
		$(CC) $(FLAGS) $(EXTRA) $(SRC) $(LIBFT_PATH) $(MLX42_PATH) -o $(NAME) -g
		clear

clean:
	@rm -f $(OFILES)
	make -C libft clean
	@$(MAKE) -C MLX42/ clean

fclean: clean
	@make fclean -C libft/
	@rm -f $(NAME)
	@$(MAKE) -C MLX42/ fclean

re:	fclean all

.PHONY: all clean fclean re
