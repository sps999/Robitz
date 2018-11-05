//argument0 = Type of item to drop

drop=instance_create(x,y,obj_item);
drop.itemDrop=argument0;
drop.image_index=argument0;
drop.hspeed=5-random(10);
