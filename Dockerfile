FROM ibrahimalafeef/yii2-abwaab:latest
RUN a2enmod rewrite
RUN sed -i -e 's|/app/web|/app/api/web|g' /etc/apache2/sites-available/000-default.conf






