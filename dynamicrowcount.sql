DECLARE @tables NVARCHAR(MAX) = 'Badges, Comments, Posts'; -- Declare the table names
DECLARE @sql NVARCHAR(MAX);

SET @sql = STUFF((
    SELECT 
        ' UNION ALL SELECT ''' + LTRIM(RTRIM(value)) + ''' AS TableName, COUNT(*) AS [RowCount] FROM [' + LTRIM(RTRIM(value)) + ']'
    FROM STRING_SPLIT(@tables, ',')
    FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 11, '');

EXEC sp_executesql @sql;
