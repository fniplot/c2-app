# Docker のマルチステージブルド機能を活用して、
# 複数のステージに分離しています。
# https://github.com/vercel/next.js/blob/canary/examples/with-docker/Dockerfile

# ベースイメージ
FROM node:lts-alpine as base

# 必要な資材をインストール
FROM base as deps
WORKDIR /app

# プロジェクトの依存ライブラリをインストールする
COPY package.json yarn.lock ./
RUN \
    if [ -f yarn.lock ]; then yarn install --frozen-lockfile; \
    else echo "lockfile not found." && exit 1; \
    fi

# アプリケーションをビルド
FROM base as builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN \
    if [ -f yarn.lock ]; then yarn run build; \
    else echo "lockfile not found." && exit 1; \
    fi

# アプリケーションを実行する環境を構築
FROM base as runner
WORKDIR /app

ENV NODE_ENV=production

COPY --from=builder /app/public ./public

# アプリを実行するユーザー、グループを作成
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs

EXPOSE 3000

ENV HOSTNAME="0.0.0.0"

CMD [ "node", "server.js" ]
