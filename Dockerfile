# Use an official Ruby runtime as a parent image
FROM ruby:3.2.2

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed gems specified in Gemfile
RUN bundle install

# Run main.rb when the container launches
CMD ["ruby", "main.rb"]

