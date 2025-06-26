# ---------- Stage 1: Build dependencies ----------
FROM python:3.13-slim AS builder

# ✅ Install curl here
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copy uv binary from official image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

COPY pyproject.toml uv.lock ./

RUN python -m venv /venv && \
    /venv/bin/python -m pip install --upgrade pip && \
    uv venv /venv && \
    uv pip install --python /venv/bin/python3 .

# ---------- Stage 2: Final runtime image ----------
FROM python:3.13-slim

# ✅ Install curl here too
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

COPY --from=builder /venv /venv
COPY . .

EXPOSE 8002

CMD ["/venv/bin/python", "app.py"]
