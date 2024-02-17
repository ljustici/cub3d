/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   false_main.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ljustici <ljustici@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/02/17 18:51:03 by ljustici          #+#    #+#             */
/*   Updated: 2024/02/17 20:03:28 by ljustici         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "cub3d.h"

int main(int argc, const char **argv)
{
    t_data data;
	char **content;

	init_data_struct(&data);
	if (check_params(argc, argv, &data) != 0)
	{
		ft_error(data);
		exit(-1);
	}
	content = get_file_input(&data);
	if (data.error != NO_ERROR)
	{
		ft_error(data);
		close(data.fd);
		exit(-1);
	}
	debug_map_content(content);
	close(data.fd);
    return (0);
}