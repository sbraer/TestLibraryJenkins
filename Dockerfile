FROM mcr.microsoft.com/dotnet/runtime-deps:6.0-alpine3.14-amd64
WORKDIR /app
LABEL maintainer="az"
RUN addgroup -g 34000 az
RUN adduser -D -G az --uid 34000 az
RUN chown -R az:az /app
USER az
ENV ASPNETCORE_Environment=Production \
	ASPNETCORE_URLS="http://+:8080" \
	DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1 \
	DOTNET_RUNNING_IN_CONTAINER=true
EXPOSE 8080/tcp

COPY /out ./
ENTRYPOINT ["./MinimalApi"]

# docker build -t sbraer/minimalapi1 .
# docker push sbraer/minimalapi1