FROM nginx:1.23

#MAINTAINER
MAINTAINER MIKE    

RUN sed -i '/location \//,/}/c\
    location / {\n\
        proxy_pass https://api-inference.huggingface.co;\n\
        proxy_set_header Host api-inference.huggingface.co;\n\
        proxy_set_header X-Real-IP $remote_addr;\n\
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n\
        proxy_set_header X-Forwarded-Proto $scheme;\n\
        # 关闭缓存\n\
        proxy_buffering off;\n\
        # 转发认证相关的头部\n\
        proxy_set_header Authorization $http_authorization;\n\
        proxy_pass_header  Authorization;\n\
        # 对 upstream 状态码检查，实现 error_page 错误重定向\n\
        proxy_intercept_errors on;\n\
        # error_page 指令默认只检查了第一次后端返回的状态码，开启后可以跟随多次重定向。\n\
        recursive_error_pages on;\n\
        # 根据状态码执行对应操作，以下为301、302、307状态码都会触发\n\
        #error_page 301 302 307 = @handle_redirect;\n\
        error_page 429 = @handle_too_many_requests;\n\
    }' /etc/nginx/conf.d/default.conf

EXPOSE 80
