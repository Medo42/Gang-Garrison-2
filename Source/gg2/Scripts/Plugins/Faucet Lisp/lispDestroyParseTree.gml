// real lispDestroyParseTree(real list)
// Recursively destroys a ds_list parse tree

var list;
list = argument0;

var head;
while (!ds_list_empty(list))
{
    head = ds_list_find_value(list, 0);
    if (is_real(head))
        lispDestroyParseTree(head);
    ds_list_delete(list, 0);
}
ds_list_destroy(list);
