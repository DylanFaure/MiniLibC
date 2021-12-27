/*
** EPITECH PROJECT, 2021
** main.c
** File description:
** main.c
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern size_t strl(const char *str);
extern char *my_strchr(const char *string, int searchedChar);
extern int my_strcmp(const char *first, const char *second);
extern int my_strncmp(const char *first, const char *second, size_t length);
extern char *my_rindex(const char *s, int c);
extern int my_strcasecmp(const char *s1, const char *s2);
extern void *my_memset(void *pointer, int value, size_t count);
extern void *my_memcpy(void *destination, const void *source, size_t size);

void printArray(int arr[], int n)
{
    for (int i=0; i<n; i++)
        printf("%d ", arr[i]);
    printf("\n");
}

int main(void)
{
    printf("===== STRLEN =====\n");
    printf("vrai strlen %ld\n", strlen("test"));
    printf("faux strlen %ld\n\n", strl("test"));

    printf("===== STRCHR =====\n");
    printf("vrai strchr = %s\n", strchr("ABCDEFG", 'D'));
    printf("faux strchr = %s\n\n", my_strchr("ABCDEFG", 'D'));
    printf("vrai strchr = %s\n", strchr("ABCDEFGDEFG", 'D'));
    printf("faux strchr = %s\n\n", my_strchr("ABCDEFGDEFG", 'D'));
    printf("vrai strchr = %s\n", strchr("ABCDEFGDEFG", 'H'));
    printf("faux strchr = %s\n\n", my_strchr("ABCDEFGDEFG", 'H'));
    printf("vrai strchr = %s\n", strchr("ABCDEFGDEFG", '\0'));
    printf("faux strchr = %s\n\n", my_strchr("ABCDEFGDEFG", '\0'));
    printf("vrai strchr = %s\n", strchr("", 'D'));
    printf("faux strchr = %s\n\n", my_strchr("", 'D'));

    printf("===== STRCMP =====\n");
    printf("STR1 = STR2\n");
    printf("vrai strcmp = %d\n", strcmp("ABCDEFG", "ABCDEFG"));
    printf("faux strcmp = %d\n\n", my_strcmp("ABCDEFG", "ABCDEFG"));
    printf("STR1 < STR2\n");
    printf("vrai strcmp = %d\n", strcmp("azerty", "qwerty"));
    printf("faux strcmp = %d\n\n", my_strcmp("azerty", "qwerty"));
    printf("STR1 < STR2\n");
    printf("vrai strcmp = %d\n", strcmp("", "azerty"));
    printf("faux strcmp = %d\n\n", my_strcmp("", "azerty"));
    printf("STR1 > STR2\n");
    printf("vrai strcmp = %d\n", strcmp("qwerty", "azerty"));
    printf("faux strcmp = %d\n\n", my_strcmp("qwerty", "azerty"));
    printf("NOTHING\n");
    printf("vrai strcmp = %d\n", strcmp("", ""));
    printf("faux strcmp = %d\n\n", my_strcmp("", ""));

    printf("===== STRNCMP =====\n");
    printf("STR1 = STR2\n");
    printf("vrai strncmp = %d\n", strncmp("ABCDEFG", "ABCDQSD", 4));
    printf("faux strncmp = %d\n\n", my_strncmp("ABCDEFG", "ABCDQSD", 4));
    printf("STR1 < STR2\n");
    printf("vrai strncmp = %d\n", strncmp("azeraaaa", "azerzzzz", 5));
    printf("faux strncmp = %d\n\n", my_strncmp("azeraaaa", "azerzzzz", 5));
    printf("STR1 > STR2\n");
    printf("vrai strncmp = %d\n", strncmp("azerzzzz", "azeraaaa", 5));
    printf("faux strncmp = %d\n\n", my_strncmp("azerzzzz", "azeraaaa", 5));

    printf("===== RINDEX =====\n");
    printf("vrai rindex = %s\n", rindex("ABCDEFG", 'D'));
    printf("faux rindex = %s\n\n", my_rindex("ABCDEFG", 'D'));
    printf("vrai rindex = %s\n", rindex("ABCDEFGDEFG", 'D'));
    printf("faux rindex = %s\n\n", my_rindex("ABCDEFGDEFG", 'D'));
    printf("vrai rindex = %s\n", rindex("ABCDEFGDEFG", 'H'));
    printf("faux rindex = %s\n\n", my_rindex("ABCDEFGDEFG", 'H'));
    printf("vrai rindex = %s\n", rindex("ABCDEFGDEFG", '\0'));
    printf("faux rindex = %s\n\n", my_rindex("ABCDEFGDEFG", '\0'));

    printf("===== STRCASECMP =====\n");
    printf("STR1 = STR2\n");
    printf("vrai strcasecmp = %d\n", strcasecmp("AbCdEfG", "ABCDEFG"));
    printf("faux strcasecmp = %d\n\n", my_strcasecmp("AbCdEfG", "ABCDEFG"));
    printf("STR1 < STR2\n");
    printf("vrai strcasecmp = %d\n", strcasecmp("AZeRtY", "qwerty"));
    printf("faux strcasecmp = %d\n\n", my_strcasecmp("AZeRtY", "qwerty"));
    printf("STR1 > STR2\n");
    printf("vrai strcasecmp = %d\n", strcasecmp("QWeRtY", "azerty"));
    printf("faux strcasecmp = %d\n\n", my_strcasecmp("QWeRtY", "azerty"));

    printf("===== MEMSET =====\n");

    char str[50] = "GeeksForGeeks is for programming geeks.";
    int arr[10];
    char str2[50] = "GeeksForGeeks is for programming geeks.";
    int arr2[10];

    printf("VRAI MEMSET\n");
    memset(str + 13, '.', 8 * sizeof(char));
    printf("Memset_Test_1 : %s\n", str);
    memset(arr, 0, 10 * sizeof(arr[0]));
    printf("Memset_Test_2 : ");
    printArray(arr, 10);

    printf("faux MEMSET\n");
    my_memset(str2 + 13, '.', 8 * sizeof(char));
    printf("Memset_Test_1 : %s\n", str2);
    my_memset(arr2, 0, 10 * sizeof(arr2[0]));
    printf("Memset_Test_2 : ");
    printArray(arr2, 10);

    printf("===== MEMCPY =====\n");

    int array[] = { 54, 85, 20, 63, 21 };
    int *copy = NULL;
    int length = sizeof(int) * 5;

    int array2[] = { 54, 85, 20, 63, 21 };
    int *copy2 = NULL;
    int length2 = sizeof(int) * 5;

    copy = (int *) malloc(length);
    memcpy(copy, array, length);
    for (length = 0; length < 5; length++) {
        printf("vrai memcpy = %d\n", copy[length]);
    }
    printf("\n");

    copy2 = (int *) malloc(length2);
    my_memcpy(copy2, array2, length2);
    for (length2 = 0; length2 < 5; length2++) {
        printf("faux memcpy = %d\n", copy2[length2]);
    }
    printf("\n");

    printf("===== MEMMOVE =====\n");

    // On crée une zone de mémoire de 10 entiers et contenant
    // que neuf valeurs. La dixième est non utilisée (0).
    int data[] = { 20, 30, 40, 50, 60, 70, 80, 90, 100, 0 };

    // On affiche le contenu de la collection
    for( int i = 0; i < 10; i++) {
        printf("contenu 1 = %d\n", data[i]);
    }
    puts("\n");  // Un retour à la ligne

    // On décale les éléménts dans la collection ...
    void *source = (void *) data;
    void *destination = (void *) (data + 1);
    size_t size = 10 * sizeof(int);
    memmove(destination, source, size);

    // ... pour y insérer une nouvelle valeur en tête
    data[0] = 10;

    // On affiche le contenu de la collection
    for( int i = 0; i < 10; i++) {
        printf("contenu 2 = %d\n", data[i]);
    }
    puts("\n");
}
