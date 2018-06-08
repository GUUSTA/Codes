#include <stdio.h>

// O que terá dentro de cada nó
typedef struct elementList
{
	int x, y;
	struct elementList *previous;
	struct elementList *next;
}element;

// Como ele será controlado
typedef struct controllerList
{
	element *start;
	element *end;
}List;

void initialization(List *list)
{
	list->start = NULL;
	list->end =  NULL;
}

int insertion_empty_list(List *list, int value_x, int value_y)
{
	element *new_element;
	if((new_element = aloc (new_element)) == NULL)
	{
		return -1;
	}
	else
	{
		new_element->previous = list->start;
		new_element->next = list->end;
		list->start = new_element;
		list->end = new_element;
		return 0;
	}
}

int remover (List *list, int position)
{
	element *remove_element, *in_progress;
	int i = 0;

	if(position == 1) //Remoção do 1° elemento da lista
	{
		remove_element = list->start;
		list->start = list->start->next;

		if (list->start == NULL)
		{
			list=end = NULL;
		}
		else
		{
			list->start->previous == NULL;
		}
	}
	else if(position == list->size) //Remoção do Último elemeto da lista
	{
		remove_element = list->end
		list->end->previous->next = NULL;
		list->end = list->end->previous;
	}
	else //Remoção em outro lugar
	{
		in_progress = list->start;
		for (i = 1; i < position; ++i)
		{
			in_progress = in_progress->next;
		}
		remove_element = in_progress;
		in_progress->previous->next = in_progress->next;
		in_progress->next->previous = in_progress->previous;
	}
	free(remove_element->x);
	free(remove_element->y);
	free(remove_element);

	return 0;
}

int main (void)
{
    List Lista;
    initialization(&list)
}
