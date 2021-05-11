FROM postgres:13-alpine

ENV IS_JSONB_VALID_GIT_SHA1='5b4ab770f4070b8166f0dda3afb3287042b1b744'

RUN apk add --no-cache \
    # Add .build-deps
    --virtual .build-deps build-base ca-certificates clang-dev llvm10 openssl tar make zip \
    # Add is_jsonb_valid https://github.com/furstenheim/is_jsonb_valid
    && wget -O /is_jsonb_valid.tar.gz https://github.com/furstenheim/is_jsonb_valid/archive/${IS_JSONB_VALID_GIT_SHA1}.tar.gz \
    && tar xvzf /is_jsonb_valid.tar.gz \
    && cd is_jsonb_valid* \
    && make install \
    && cd .. \
    && rm -rf is_jsonb_valid*/ \
    # Delete .build-deps
    && apk del .build-deps
