# Use the Nginx image
FROM nginx

# Remove the default nginx.conf
RUN rm /etc/nginx/conf.d/default.conf

# Replace with our own nginx.conf
COPY conf/nginx.conf /etc/nginx/conf.d/

# Section below switches nginx from root to
RUN chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx/conf.d && \
    chmod -R 766 /var/log/nginx/
 
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid && \
    chown -R nginx:nginx /var/cache/nginx
 
USER nginx
