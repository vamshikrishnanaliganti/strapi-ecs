import re

with open('ecs.tf', 'r') as f:
    content = f.read()

db_env = '''        {
          name  = "DATABASE_CLIENT"
          value = "postgres"
        },
        {
          name  = "DATABASE_HOST"
          value = replace(aws_db_instance.postgres.endpoint, ":5432", "")
        },
        {
          name  = "DATABASE_PORT"
          value = "5432"
        },
        {
          name  = "DATABASE_NAME"
          value = var.db_name
        },
        {
          name  = "DATABASE_USERNAME"
          value = var.db_username
        },
        {
          name  = "DATABASE_PASSWORD"
          value = var.db_password
        },
        {'''

content = content.replace('      environment = [\n        {', f'      environment = [\n{db_env}')

with open('ecs.tf', 'w') as f:
    f.write(content)

print("Done!")
