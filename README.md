# Iron Alum Web API Standards
* [Guidelines](#guidelines)
* [UML](#uml)
* [RESTful URLs](#restful-urls)
* [Using Iron Alum API](#using-iron-alum-api)
* [JSON Parameters](#json-parameters)
* [Example Tables](#example-tables)

## Guidelines
This README will describe how to interact with the Iron Alum API. 
It provides guidelines and examples for the Iron Alum API in hopes to  encourage consistency and maintainability across multiple devices and applications.  

This document borrows heavily from:

* [White House Web API Standards] (http://github.com/WhiteHouse/api-standards/blob/master/README.md)
* [Ryan Yep's Find-A-Spot] (http://github.com/rcyep87/Find-A-Spot/blob/master/README.md)
* [Matthew Giardina's Cat Chat] (https://github.com/mlgiardina/cat_chat)

## User Stories
Trello: [Iron Alum](http://trello.com/b/XWQoDM0K/iron-alum)

## UML
![](http://i.imgur.com/tmEKPDx.png) 

## RESTful URLs

### General guidelines for RESTful URLs
* A URL identifies a resource.
* URLs should include nouns, not verbs.
* Use plural nouns only for consistency (no singular nouns).
* Use HTTP verbs (GET, POST, PUT, DELETE) to operate on the collections and elements.
* You shouldn’t need to go deeper than resource/identifier/resource.

## Using Iron Alum API
In order to use the Iron Alum API, the user must make the approiate request with the correct RESTful url. When the word '`:resource`' is used, it refers to either '`students`', '`cohorts` or '`locations` and can be substitued with the respective resource.

###  Accessing All Iron Yard students, cohorts or locations:

* `GET` request to `http://iron-alum.herokuapp.com/:resource` will display JSON of all the records currently held in the database for that respective `:resource`. 

- For example: http://iron-alum.herokuapp.com/locations will return all the different location JSON objects within an array with the following parameters:

```

	city: string
	state: string
	created_at: timestamp
	updated_at: timestamp
	
```

###  Accessing a specific Iron Yard student, cohort or location:

* Send a `GET` request to `http://iron-alum.herokuapp.com/:resource/:id` will show a specific record with the respective id number, shoud that record exist. If you choose an `:id` that doesn't exist in the database, it will render an error. 

- For example: http://iron-alum.herokuapp.com/students/1 will return the JSON format with the following format:

```
	
	f_name: string
	l_name: string
	email: string
	bio: text
	linked_in: string
	github: string
	employed: boolean
	place_employed: string
	cohort_id: int
	location_id: int
	created_at: timestamp
	updated_at: timestamp
	
```

###  Accessing All Iron Yard students by location and course:

* Send a `GET` request to `http://iron-alum.herokuapp.com/:locations/:course_name/` accesses all students within a specific cohort relative to its location where `:course_name` is an attribute of the `:cohort` resource/object. If you choose an `:location` or `:course_name` that doesn't exist in the database, it will render an error.

###  Accessing a specific Iron Yard student by location and course:

* Send a `GET` request to `http://iron-alum.herokuapp.com/:locations/:course_name/:id` accesses a specific student within a specific cohort relative to its location where `:course_name` is an attribute of the `:cohort` resource/object and `:id` being the students unique identifier. If you choose an `:location`, `:course_name` or `:id` that doesn't exist in the database, it will render an error.

###  Creating an Iron Yard student, cohort or location:

* Send a `POST`request to `http://iron-alum.herokuapp.com/:resource` allows you to create a new `student`, `cohort` or `location`. The value `nil` is not allowed for any parameters other than `place_employed:` for a Student JSON object. For the `POST` request, all parameters must contain a value and those values must match  their respective data type.

###  Updating an Iron Yard student, cohort or location:

* Send a `PUT`request to `http://iron-alum.herokuapp.com/:resource/:id` allows you to update a `student`, `cohort` or `location`. The value `nil` is not allowed for any parameters other than `place_employed:` for a Student JSON object. For the `PUT` request, the parameter to be updated must contain a value and those values must match its respective data type.

## JSON Parameters

The parameters for each table are as follows:

```
Student:
	{
	f_name: string,
	l_name: string,
	email: string,
	bio: text,
	linked_in: string,
	github: string,
	employed: boolean,
	place_employed: string, ('nil' allowed)
	cohort_id: int,
	location_id: int
	}
	
	Cohort:
	{
	course_name: string,
	start_date: date,
	end_date: date,
	location_id: int
	}
	
	Location:
	{
	city: string,
	state: string
	}
```
## Example Tables

### Locations

| id |         city               |  state  |
|:---|:--------------------------:|:-------:|
| 1  |          Austin            |    TX   |
| 2  |          Dallas            |    TX   |
| 3  |          Houston           |    TX   |

### Cohorts

| id | course_name|	start_date|  end_date |  location_id  |
|:--|:-----------:|:---------:|:---------:|:-------------:|
| 1 |   Frontend  |	2015-08-24| 2015-11-13|      1        |
| 2 |   Backend   |	2015-08-24| 2015-11-13|      1        |
| 3 |   Design    |	2015-08-24| 2015-11-13|      1        |
| 4 |   Frontend  |	2015-08-24| 2015-11-13|      2        |
| 5 |   Backend   |	2015-08-24| 2015-11-13|      2        |
| 6 |   Design    |	2015-08-24| 2015-11-13|      2        |
| 7 |   Frontend  |	2015-08-24| 2015-11-13|      3        |
| 8 |   Backend   |	2015-08-24| 2015-11-13|      3        |
| 9 |   Design    |	2015-08-24| 2015-11-13|      3        |