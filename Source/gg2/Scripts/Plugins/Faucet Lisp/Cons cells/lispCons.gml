// real lispCons(real/string head, real/string tail)
// Constructs a cons cell from a head and a tail

var head, tail;
head = argument0;
tail = argument1;

var cell;
cell = ds_list_create();
ds_list_add(cell, head);
ds_list_add(cell, tail);
lispAddRef(head);
lispAddRef(tail);

return cell;
