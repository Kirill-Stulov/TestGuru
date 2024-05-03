# README

About: this is Task #11 by Thinknetika. TestGuru project -> https://thinknetica.teachbase.ru/course_sessions/621069/tasks/227376/take?return_url=/viewer/sessions/621069/tasks/227376

!!! Cody codebase embeddings (Enhanced Context) for TestGuru will work after:
  1. git repo in this folder will be set
  2. remote origin for this repo is set
  3. TestGuru is indexed: need to restart vscode and cody chat will try to index project folder again 

About TestGuru application:
  https://thinknetica.teachbase.ru/viewer/sessions/643781/materials/2097104
  Purpose of this app is to create and manage different tests/ Приложение предназначено для создания и управления различными тестами.
  Tests with questions and answers choices are the core of the system./ Основой системы будут тесты с вопросами и вариантами ответов.
  Two groups of users: 1. users who choose and pass tests 2. admins who create and manage tests./ Две группы пользователей: 1. те кто выбирает и проходит тесты 2. админы которые создают и управляют тестами.
  Tasks:
    - Create tests and manage them
    - Authentication
    - Basic access control. Only for admins of tests are able to create and manage tests.
    - Passing tests
    - Publishing results of tests in social networks
  Задачи:
    - Создание тестов и управление ими
    - Аутентификация
    - Базовое разграничение прав доступа. Чтоб была возможность создавать и управлять тестами только у админов тестов
    - Выполнение тестов
    - Публикация результатов тестов в соцсети

List of real world entities:
  -Users
    Admin users who create/manage tests
    Regular users who take tests

  -Tests
    A test/quiz entity
    Has attributes like title, description, passing score etc

  -Questions
    Individual questions that make up a test
    Has attributes like text, type (multiple choice, true/false etc)

  -Answers
    Possible answers for a question
    Would have attributes like text, correct/incorrect
  
  -Test Results
    Results of a user taking a test
    Could track score, time taken, questions correct/incorrect

  -Categories
    Tests can be organized into categories/groups
  
  -Some other entities that may make sense:
    Roles - model for managing admin vs regular users
    Test Versions - for tracking revisions of tests
    Certificates - issued to users for passing
  
  -Key relationships:
    User has many Test Results
    Test has many Questions
    Question has many Answers

Things I may want to cover:
* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...
