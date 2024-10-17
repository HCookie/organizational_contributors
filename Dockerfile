#checkov:skip=CKV_DOCKER_2
#checkov:skip=CKV_DOCKER_3
FROM python:3.13-slim@sha256:2ec5a4a5c3e919570f57675471f081d6299668d909feabd8d4803c6c61af666c
LABEL com.github.actions.name="organizational_contributors" \
    com.github.actions.description="GitHub Action that given an organization or repository, produces information about the contributors sorted by the organisation." \
    com.github.actions.icon="users" \
    com.github.actions.color="green" \
    maintainer="@hcookie" \
    org.opencontainers.image.url="https://github.com/HCookie/organizational_contributors" \
    org.opencontainers.image.source="https://github.com/HCookie/organizational_contributors" \
    org.opencontainers.image.documentation="https://github.com/HCookie/organizational_contributors" \
    org.opencontainers.image.vendor="HCookie" \
    org.opencontainers.image.description="GitHub Action that given an organization or repository, produces information about the contributors sorted by the organisation."

WORKDIR /action/workspace
COPY requirements.txt contributors LICENSE pyproject.toml README.md /action/workspace/ 

RUN python3 -m pip install --no-cache-dir ./ \
    && apt-get -y update \
    && apt-get -y install --no-install-recommends git=1:2.39.5-0+deb12u1 \
    && rm -rf /var/lib/apt/lists/* 

CMD ["contributors"]
ENTRYPOINT ["python3", "-m"]
