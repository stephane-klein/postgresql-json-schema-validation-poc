SET client_min_messages = error;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
CREATE EXTENSION IF NOT EXISTS "is_jsonb_valid" WITH SCHEMA public;

DROP TABLE IF EXISTS public.tasks CASCADE;
DROP TYPE IF EXISTS public.task_type_enum CASCADE;

CREATE TYPE public.task_type_enum AS ENUM (
    'SUGGEST_DATE_TASK',
    'ACCEPT_OR_DECLINE_DATE_TASK',
    'ACKNOWLEDGE_TASK'
);

CREATE TABLE public.tasks (
    id             UUID PRIMARY KEY DEFAULT uuid_generate_v4() NOT NULL,
    task_type      public.task_type_enum NOT NULL,
    result         JSONB DEFAULT NULL,
    CHECK (
        (
            (task_type = 'SUGGEST_DATE_TASK') AND
            is_jsonb_valid(
                '{
                    "type": "object",
                    "properties": {
                        "response": {
                            "type": "string",
                            "enum": ["DATE_SUGGESTED", "TASK_CANCELED"]
                        },
                        "zoned_date": {"type": "string"}
                    },
                    "required": ["response"]
                }',
                result
            )
        ) OR
        (
            (task_type = 'ACCEPT_OR_DECLINE_DATE_TASK') AND
            is_jsonb_valid(
                '{
                    "type": "object",
                    "properties": {
                        "response": {
                            "type": "string",
                            "enum": ["ACCEPTED", "DECLINED"]
                        },
                        "comment": {"type": "string"}
                    }
                }',
                result
            )
        ) OR
        (
            (task_type = 'ACKNOWLEDGE_TASK') AND
            is_jsonb_valid(
                '{
                    "type": "object",
                    "properties": {
                        "response": {
                            "type": "string",
                            "enum": ["RECEIVED", "NOT_RECEIVED"]
                        }
                    }
                }',
                result
            )
        )
    )
);

SET client_min_messages = INFO;
