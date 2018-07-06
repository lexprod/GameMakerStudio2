//oGame uses this to restart saves

for (var i = movecount; i > 0; i--)
{
	movefile = ds_stack_pop(movelist);
	//delete that file
	if (file_exists(movefile)) 
	{
		file_delete(movefile)
	}
}