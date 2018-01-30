-- Generated by Oracle SQL Developer REST Data Services 17.4.0.355.2349
-- Exported REST Definitions from ORDS Schema Version 17.4.1.353.06.48
-- Schema: HR   Date: Fri Jan 19 11:46:40 EST 2018
--
BEGIN
  ORDS.DEFINE_MODULE(
      p_module_name    => 'parameters', -- the name of RESTFul Service Module that will be used to organize our example services
      p_base_path      => '/parameters/', -- how to address the module off of the base /ords URI
      p_items_per_page =>  25, -- the default number of items to return on a request for all module services
      p_status         => 'PUBLISHED', -- PUBLISHED = LIVE or ON
      p_comments       => NULL);      
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'parameters',
      p_pattern        => 'headers', -- the pattern we want to publish HANDLERS for, so /ords/hr/parameters/headers
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'parameters',
      p_pattern        => 'headers',
      p_method         => 'GET', -- you can have a GET, PUT, POST, or DELETE handler. Each will have a SQL or PLSQL block
      p_source_type    => 'json/collection', -- we are returning data as json 
      p_items_per_page =>  25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'select * from parameters
where id = :id' -- p_source, this is the SQL block executed when you hit /ords/hr/parameters/headers via GET
      ); 
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'parameters',
      p_pattern            => 'headers',
      p_method             => 'GET',
      p_name               => 'id', -- the name of the HTTP HEADER parameter
      p_bind_variable_name => 'id', -- how to address it in the SQL block, e.g. :id 
      p_source_type        => 'HEADER', 
      p_param_type         => 'INT',
      p_access_method      => 'IN', -- it's coming IN, the only valid option for a GET request
      p_comments           => NULL);      
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'parameters',
      p_pattern        => 'headers',
      p_method         => 'POST', -- using POST so we can use a HTTP RESPONSE
      p_source_type    => 'plsql/block',
      p_items_per_page =>  0,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'declare
 how_many integer;
begin
 select count(*) into how_many from parameters;
 :total := how_many;
 :message := ''There are '' || how_many || '' records in the parameters table.'';
end;'
      );
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'parameters',
      p_pattern            => 'headers',
      p_method             => 'POST',
      p_name               => 'count',
      p_bind_variable_name => 'total',
      p_source_type        => 'HEADER', -- paramter being assigned for the RESPONSE HEADER
      p_param_type         => 'INT', -- it's a number
      p_access_method      => 'OUT', -- it's only going OUT
      p_comments           => NULL);      
  ORDS.DEFINE_PARAMETER(
      p_module_name        => 'parameters',
      p_pattern            => 'headers',
      p_method             => 'POST',
      p_name               => 'message',
      p_bind_variable_name => 'message',
      p_source_type        => 'RESPONSE', -- the HTTP response body
      p_param_type         => 'STRING', -- we'll return text
      p_access_method      => 'OUT',
      p_comments           => NULL);      
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'parameters',
      p_pattern        => 'headers-classic',
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'parameters',
      p_pattern        => 'headers-classic', -- nothing special here, no need to define any parameters
      p_method         => 'GET',             -- ORDS will build a parameter on the fly when passed via the URL
      p_source_type    => 'json/collection',
      p_items_per_page =>  25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'select * from parameters
where id = :id' -- will return 0 records unless user includes ?id=value on the URI of the GET request 
      );
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'parameters',
      p_pattern        => 'headers/:id', -- the parameter is built into the pattern, no need to declare
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'parameters',
      p_pattern        => 'headers/:id',
      p_method         => 'GET',
      p_source_type    => 'json/collection',
      p_items_per_page =>  25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'select * from parameters where id = :id' -- the bind must match the URI pattern
      );
  ORDS.DEFINE_TEMPLATE(
      p_module_name    => 'parameters',
      p_pattern        => 'headers/:words/:age', -- we now have two, separated by a /, they are assigned positionally 
      p_priority       => 0,
      p_etag_type      => 'HASH',
      p_etag_query     => NULL,
      p_comments       => NULL);
  ORDS.DEFINE_HANDLER(
      p_module_name    => 'parameters',
      p_pattern        => 'headers/:words/:age',
      p_method         => 'GET',
      p_source_type    => 'json/collection',
      p_items_per_page =>  25,
      p_mimes_allowed  => '',
      p_comments       => NULL,
      p_source         => 
'SELECT *
FROM parameters
WHERE
    age =:age
    AND   words =:words'
      );


  COMMIT; 
END;