module TrainingApp
  course_json = '{
    "title":"Introduction to Ember.js",
    "description_main":"Want to improve (or create) your Ember.js skills? We\'ll take you from beginner all the way through to creating a complete, well-architected web application. Each lecture is followed by a hands-on lab that will apply the learned concepts immediately.\r\n\r\n# Who will Benefit\r\n\r\nChoose this training session if you\'re an intermediate web developer with a good understanding of HTML, CSS, and JavaScript. Prior experience with Ember is not expected, but you should have a strong understanding of working with the DOM using jQuery.\r\n\r\nYou should already be experienced with web development, but have a desire to ramp up your skills to create more \"application-like\" experiences.\r\n\r\nWe expect participants in this course to be fluent in JavaScript. The pace of the course is designed for those who have had significant hands-on experience using JavaScript. \r\n\r\n# What to Expect\r\n\r\nIn this course, you will be building a full-fledged Ember application from the ground up. As you build the application, we will explain the concepts behind each feature that you will need to implement.\r\n\r\nFor each feature, we will provide you with a comprehensive set of failing unit and integration tests. Your job will be to complete the feature using the concepts that we have described in order to make the test pass.\r\n\r\nThis process will both help you smoothly progress throughout the course and provide you with the tools you will need to write tests for your own applications.\r\n\r\n# Course Breakdown\r\n\r\n### Scalable Application Architecture\r\n\r\nYou\'ll learn how to use the MVC (Model-View-Controller) pattern to manage the complexity of your application as it grows. By separating code into distinct objects that work independently, you can test, debug, and collaborate more easily.\r\n\r\nYou’ll also learn best practices for organizing your source code in a way that makes it easy for your team to understand each other\'s code.\r\n\r\n### Views \u0026 Templates\r\n\r\nDiscover how to build advanced user interfaces with composable views that bind to your model data and always stay up-to-date.\r\n\r\n### Routing \r\n\r\nEmber\'s router puts the URL front and center. We\'ll show you how to map URLs to templates and models, which makes your apps shareable, as well as serving as the scaffolding that allows your application to grow without collapsing in on itself.\r\n\r\n### DOM Integration\r\n\r\nMost of the time, you\'ll be using Ember objects and templates to keep your UI up to date as things change. We\'ll teach you how to integrate directly with native browser features, like the `\u003Caudio\u003E` tag so that your UI can seamlessly take advantage of continued improvements to the web platform.\r\n\r\n### Actions and Events\r\n\r\nYou\'ll learn how to use actions and events to communicate between the components of your application.\r\n\r\n### Persistence\r\n\r\nSyncing data with a backend server is one of the most challenging aspects of writing a web application. We’ll cover different techniques for retrieving, updating, and deleting records in a way that’s fast, flexible, and maintainable. You’ll also learn how best to handle authorizing users in single-page applications.\r\n\r\n### Ember.js Object Model\r\n\r\nEmber.js includes a powerful object model that brings many advanced features to the browser. You’ll learn how to best use these tools to share common code, describe relationships between objects, and react asynchronously to changes in your data, with:\r\n\r\n* Objects\r\n* Observers\r\n* Computed Properties\r\n* Mixins\r\n\r\n### Testing\r\n\r\nAfter isolating your application into its constituent MVC components, learn best practices for testing each of these in an automated way. We’ll show you how to use QUnit to reduce bugs in your application and catch regressions. These concepts are easily applicable to the testing framework of your choice.\r\n\r\n### Debugging \r\n\r\nGo in-depth with web developer tools to learn how to troubleshoot problems in your application. We’ll survey the landscape of available software, as well as cover Ember.js-specific tips and tricks that will shave hours off your debugging time.",
    "start_date":null,
    "end_date":null,
    "price":799,
    "created_at":"2013-10-02T11:31:49.274-04:00",
    "updated_at":"2014-03-03T11:10:53.684-05:00",
    "venue_id":null,
    "image_url":"//www.gravatar.com/avatar/0cf15665a9146ba852bf042b0652780a?s=200",
    "synopsis":null,
    "capacity":null,
    "early_bird_price":null,
    "early_bird_end_date":null,
    "registration_link":"",
    "parent_course_id":null,
    "online":true,
    "color_primary":"#E14A30",
    "color_secondary":"#A73621",
    "active":true,
    "introduction":"![Ember player](//drxwg5otdx721.cloudfront.net/static/images/ember-intro--video.jpg)\r\nEach chapter will have a video of the lesson being taught.\r\n\r\n![Ember git](//drxwg5otdx721.cloudfront.net/static/images/ember-intro--github.jpg)\r\nGet confused? No problem, just pull the branch of the lesson you are working on to get up to speed."
  }'

  course_attrs = JSON.parse(course_json)
  course = Course.where(title: course_attrs['title']).first_or_create!(course_attrs)

  section_attrs = JSON.parse('{"id":10,"title":"Introduction","course_id":4,"sort_order":null}')
  section = course.sections.where(title: section_attrs['title']).first_or_create!(section_attrs)

  chapter_json = '{
    "title":"Git Instructions",
    "sort_order":0,
    "description":"This course is designed to be extremely hands-on. As part of the hands-on learning, we\'ve provided you with a git repository that contains the starting point for the app you\'ll be building.\r\n\r\nAs you follow along with the videos in the course, you\'ll be instructed to complete a particular step number. Each step asks you to implement a feature that exercises one or more concepts in Ember. Each step has a series of unit and integration tests that you can run to verify that you have implemented the feature correctly.\r\n\r\nDownload the zip file below to save the git repository to your computer. As you go through the steps, you\'ll build from the starting point provided here to the fully-functioning app.\r\n\r\nIf at any point you get stuck, you can always move on to the next step by resetting the repository to the appropriate step number.\r\n\r\nFor example, if you get stuck on step 3 and want to move on to step 4, from the command line you would type:\r\n\r\n```\r\ngit reset --hard step4\r\n```\r\n\r\nThis will get your repository to a clean state ready to work on step 4. Note that resetting like this **will** destroy any code that you had written and give you a version of the code base that we have prepared. If you want to save your work, make a copy of the directory.\r\n\r\nYou can find more information about the directory layout and information on running the tests in the first section\'s videos.\r\n\r\n[Download Git Repository](//gaslight-cdn.s3.amazonaws.com/ember-training/ember-online-training.zip)\r\n\r\n### Need some help with Git?\r\n\r\nHere are a couple links to help. The first is a basic intro online – nothing to install. The second will help you set up Git on your computer. Once you\'ve done that, you can open the folder and use a tool like SourceTree to browse the repository. SourceTree is linked below also.\r\n\r\nFor this course, you\'ll just need to know how to reset to a particular step. That\'s just `git reset step3 --hard` where `step3` is the tag name you want to jump to.\r\n\r\n* [http://try.github.io/levels/1/challenges/1](http://try.github.io/levels/1/challenges/1)\r\n* [http://gitimmersion.com/index.html](http://gitimmersion.com/index.html)\r\n* [http://www.sourcetreeapp.com/](http://www.sourcetreeapp.com/)\r\n",
    "video_url":"",
    "code_url":"",
    "poster_url":"",
    "demo":false,
    "duration":null
  }'

  chapter_attrs = JSON.parse(chapter_json)
  chapter = section.chapters.where(title: chapter_attrs['title']).first_or_create!(chapter_attrs)

  registration_json = '{
    "id":47,
    "amount":799,
    "stripe_token":"tok_3",
    "name":"Len",
    "email":"student@example.com",
    "organization":null,
    "phone":null,
    "created_at":"2014-05-06T15:48:50.839-04:00",
    "updated_at":"2014-05-06T15:48:50.839-04:00",
    "customer_id":"cus_3",
    "referral_token":null,
    "code":"12345",
    "last4":"4553",
    "card_type":"Visa",
    "expires_on":"2016-10-01",
    "discount_code_id":null
  }'

  registration_attrs = JSON.parse(registration_json).merge(course_id: course.id)
  registration = Registration.where(name: registration_attrs['name']).first_or_create!(registration_attrs)
end

