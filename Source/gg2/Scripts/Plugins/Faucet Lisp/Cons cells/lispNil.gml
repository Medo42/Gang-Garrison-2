// real lispNil()
// Returns the lisp nil value

// We create a ds_list and don't use it at all
// This just ensures a unique value for Nil
if (!variable_global_exists('lisp_nil'))
{
    global.lisp_nil = ds_list_create();
}

return global.lisp_nil;
