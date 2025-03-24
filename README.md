# PostgreSQL

1. What is PostgreSQL?

**Answer**: **PostgreSQL** হল একটি ওপেন সোর্স রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS), যা ডেটা সংরক্ষণ এবং পরিচালনার জন্য ব্যবহৃত হয়। এটি SQL (Structured Query Language) ব্যবহার করে ডেটাবেস পরিচালনা এবং কিউরি কার্যক্রম পরিচালনা করে। PostgreSQL তে টেবিল, ইনডেক্স, ভিউ এবং অন্যান্য ডেটাবেস অবজেক্ট সহ অনেক উন্নত বৈশিষ্ট্য রয়েছে।

2. What is the purpose of a database schema in PostgreSQL?

**Answer**: PostgreSQL-এ ডেটাবেস স্কিমা একটি লজিক্যাল কনটেইনার যা টেবিল, ভিউ, ইনডেক্স এবং অন্যান্য ডেটাবেস অবজেক্ট সংরক্ষণ করে।। এটি ডেটাবেস অবজেক্টগুলোর গঠন এবং সম্পর্ক নির্ধারণ করে এবং ডেটাবেসের সঠিক সংগঠন ও পরিচালনার জন্য গুরুত্বপূর্ণ ভূমিকা পালন করে।

3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

**Answer**:

 * **Primary Key**: প্রাইমারি কি হল একটি কলাম বা কলাম সমষ্টি যা টেবিলের প্রতিটি সারিকে অনন্যভাবে চিহ্নিত করে। এটি নাল (NULL) হতে পারে না এবং এটি অবশ্যই ইউনিক হতে হবে।

 * **Foreign Key**: ফরেন কি হল একটি কলাম যা অন্য টেবিলের প্রাইমারি কির সাথে সম্পর্কিত থাকে, যা ডেটাবেসের মধ্যে সম্পর্ক তৈরি করে।

4. What is the difference between the VARCHAR and CHAR data types?

**Answer**:

* **VARCHAR**: এটি একটি পরিবর্তনশীল দৈর্ঘ্যের স্ট্রিং ডেটা টাইপ। এর মানে হল যে ডেটার দৈর্ঘ্য যতটুকু হবে ততটুকুই স্টোর হবে, তাই এটি স্থান সাশ্রয়ী।

* **CHAR**: এটি একটি স্থির দৈর্ঘ্যের স্ট্রিং ডেটা টাইপ। যদি স্ট্রিংয়ের দৈর্ঘ্য ছোট হয়, তবে বাকী স্থানে স্পেস পূর্ণ করা হয়।

5. Explain the purpose of the WHERE clause in a SELECT statement.

**Answer**: WHERE ক্লজটি ব্যবহার করা হয় ডেটাবেস থেকে নির্দিষ্ট শর্ত অনুযায়ী ডেটা বের করার জন্য। এটি একটি ফিল্টার হিসেবে কাজ করে, যেখানে আপনি নির্দিষ্ট শর্তের ভিত্তিতে রেকর্ড নির্বাচন করতে পারেন।

6. What are the LIMIT and OFFSET clauses used for?

**Answer**:

* **LIMIT**: এটি ব্যবহৃত হয়, একাধিক রেকর্ডের মধ্যে সীমিত সংখ্যক রেকর্ড ফেরত দিতে। উদাহরণস্বরূপ, আপনি ১০টি রেকর্ড ফেরত চাইলে ```LIMIT``` 10 ব্যবহার করবেন।

* **OFFSET**: এটি ব্যবহৃত হয় নির্দিষ্ট সংখ্যক রেকর্ড বাদ দিয়ে বাকী রেকর্ডগুলি ফেরত দিতে। উদাহরণস্বরূপ, আপনি প্রথম ১০টি রেকর্ড বাদ দিয়ে পরবর্তী ১০টি রেকর্ড চান, তখন ```OFFSET``` 10 ব্যবহার করবেন।


7. How can you modify data using UPDATE statements?

**Answer**: ```UPDATE``` স্টেটমেন্ট ব্যবহার করে আপনি টেবিলের কোনো নির্দিষ্ট রেকর্ডের মান পরিবর্তন করতে পারেন। ```SET``` ক্লজের মাধ্যমে আপনি যে কলামের মান পরিবর্তন করতে চান তা নির্দিষ্ট করতে পারেন, এবং ```WHERE``` ক্লজের মাধ্যমে সংশ্লিষ্ট সারি নির্বাচন করা হয়। যেমন:

``` bash

UPDATE table_name SET column_name = 'new_value' WHERE condition;

```
