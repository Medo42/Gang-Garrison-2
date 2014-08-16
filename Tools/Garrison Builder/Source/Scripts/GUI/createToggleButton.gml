{
  new_button = instance_create(0, 0, ToggleButton);
  new_button.tool = sprite_get_name(argument0);
  new_button.sprite_index = argument0;
  new_button.toggled = argument1;
}