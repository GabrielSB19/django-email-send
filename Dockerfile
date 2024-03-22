FROM python:3.11.6-alpine3.18 


# install dependencies 
RUN pip3 install --upgrade setuptools 
RUN python -m pip install --upgrade pip

WORKDIR /app

# Copia el código fuente de tu aplicación al directorio de trabajo
COPY . /app/

COPY requirements.txt /app/


RUN pip install --no-cache-dir -r requirements.txt

# port where the Django app runs  
EXPOSE 8000  

# Use the entrypoint script as the CMD instruction
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]