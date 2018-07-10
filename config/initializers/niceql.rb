if defined? Niceql
  Niceql.configure do |c|
    # Setting pg_adapter_with_nicesql to true will force formatting SQL queries
    # before executing them, this will lead to better SQL-query debugging and much clearer error messages
    # if you are using Postgresql as a data source.
    # You can adjust pg_adapter in prooduction but do it at your own risk!
    # If you need to debug SQL queries in production use exec_niceql
    # default: false
    # uncomment next string to enable in development
    # c.pg_adapter_with_nicesql = Rails.env.development?

    # uncomment next string if you want to log prettified SQL inside ActiveRecord logging.
    # default: false
    c.prettify_active_record_log_output = true

    # now error prettifying is configurable
    # default: defined? ::ActiveRecord::Base && ActiveRecord::Base.configurations[Rails.env]['adapter'] == 'postgresql'
    # c.prettify_pg_errors = defined? ::ActiveRecord::Base && ActiveRecord::Base.configurations[Rails.env]['adapter'] == 'postgresql'

    # spaces count for one indentation
    c.indentation_base = 2

    # setting open_bracket_is_newliner to true will start opening brackets '(' with nested subqueries from new line
    # i.e. SELECT * FROM ( SELECT * FROM tags ) tags; will transform to:
    # SELECT *
    # FROM
    # (
    #    SELECT * FROM tags
    #  ) tags;
    # when open_bracket_is_newliner is false:
    # SELECT *
    # FROM (
    #   SELECT * FROM tags
    # ) tags;
    # default: false
  end
end
