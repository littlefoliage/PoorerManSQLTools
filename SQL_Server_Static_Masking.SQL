

SELECT sch.name as sch_nm,tab.name as tab_nm, col.name as col_nm,typ.system_type_id as col_typ_id,typ.name as col_typ,
typ.max_length,typ.precision,typ.scale
FROM sys.schemas sch left join sys.tables tab on sch.schema_id=tab.schema_id
left join sys.columns col on tab.object_id=col.object_id
inner join sys.types typ on typ.system_type_id=col.system_type_id
WHERE (col.name not like '%\_id'  ESCAPE '\'  and col.name not like '%\_dwid'  ESCAPE '\') and typ.name in 
('text',
'ntext',
'varchar',
'char',
'nvarchar',
'nchar',
'tinyint',
'smallint',
'int',
'money',
'float',
'decimal',
'numeric',
'bigint'
--,'date',
--'time',
--'datetime2',
--'smalldatetime',
--'datetime'
)
