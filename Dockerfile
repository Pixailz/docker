ARG					TAG=edge

FROM				alpine:${TAG} AS base

RUN					apk add --upgrade --progress --virtual dependencies \
						wget \
					&& rm -f /var/cache/apk/*

#=#=#

FROM				base AS packed

COPY				--chown=root:root --chmod=755 entrypoint /run

STOPSIGNAL			SIGINT

WORKDIR				/src/project

ENV					DOCKER_DEBUG=""

ENTRYPOINT	[ "/run/entrypoint" ]
