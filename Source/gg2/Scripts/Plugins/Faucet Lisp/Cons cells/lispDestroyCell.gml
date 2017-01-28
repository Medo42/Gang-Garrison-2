// real lispDestroyCell(real cell)
// Destroys a cons cell

var cell;
cell = argument0;

lispRemoveRef(lispHead(cell));
lispRemoveRef(lispTail(cell));
ds_list_destroy(cell);
