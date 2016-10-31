--liquibase formatted sql
--see http://www.liquibase.org/
--see ImageMagick convert function paramters

--changeset sixarm@sixarm.com:1
create table imagemagick_filter (
  id int not null primary key,
  name_en varchar(255),         -- example: Shrink to fit
  name_fr varchar(255),         -- example: ?
  geometry_x int unsigned,      -- the x width in pixels
  geometry_y int unsigned,      -- the y height in pixels
  quality_jpg int unsigned, 
  quality_png_zlib_compression_level smallint(2) unsigned,
  quality_png_filtering_type smallint(2) unsigned,
  bytes_max int(11) unsigned,   -- upper limit of byte count
  dpi int(10) unsigned,         -- dots per inch
);
--rollback drop table imagemagick_filter;