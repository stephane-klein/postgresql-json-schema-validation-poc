TRUNCATE public.tasks CASCADE;

INSERT INTO public.tasks
    (
        task_type,
        result
    )
    VALUES(
        'SUGGEST_DATE_TASK',
        '{
            "response": "DATE_SUGGESTED",
            "zoned_date": "2021-05-15 10:00:00"
        }'
    );

INSERT INTO public.tasks
    (
        task_type,
        result
    )
    VALUES(
        'SUGGEST_DATE_TASK',
        '{
            "response": "TASK_CANCELED"
        }'
    );

INSERT INTO public.tasks
    (
        task_type,
        result
    )
    VALUES(
        'ACCEPT_OR_DECLINE_DATE_TASK',
        '{
            "response": "ACCEPTED"
        }'
    );

INSERT INTO public.tasks
    (
        task_type,
        result
    )
    VALUES(
        'ACCEPT_OR_DECLINE_DATE_TASK',
        '{
            "response": "DECLINED",
            "comment": "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        }'
    );

INSERT INTO public.tasks
    (
        task_type,
        result
    )
    VALUES(
        'ACKNOWLEDGE_TASK',
        '{
            "response": "RECEIVED"
        }'
    );

INSERT INTO public.tasks
    (
        task_type,
        result
    )
    VALUES(
        'ACKNOWLEDGE_TASK',
        '{
            "response": "NOT_RECEIVED"
        }'
    );

