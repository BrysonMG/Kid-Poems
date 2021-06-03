    --What grades are stored in the database?
    select Name from Grade;

    --What emotions may be associated with a poem?
    select Name from Emotion;

    --How many poems are in the database?
    select count(title) NumberOfPoems from Poem;

    --Sort authors alphabetically by name. What are the names of the top 76 authors?
    select top 76 Name from Author
	    order by Name;

    --Starting with the above query, add the grade of each of the authors.
    select top 76 Author.Name Writer, Grade.Name GradeLevel from Author
	    left join Grade on Grade.Id = Author.GradeId
	    order by Writer;

    --Starting with the above query, add the recorded gender of each of the authors.
    select top 76 Author.Name Writer, Grade.Name GradeLevel, Gender.Name Gender from Author
	    left join Grade on Grade.Id = Author.GradeId
	    left join Gender on Gender.Id = Author.GenderId
	    order by Writer;

    --What is the total number of words in all poems in the database?
    select sum(WordCount) TotalWordCount from Poem;

    --Which poem has the fewest characters?
    select top 1 * from Poem
	    order by CharCount asc

    --How many authors are in the third grade?
    select COUNT(Id) ThirdGraders from Author
	    where Author.GradeId = 3;

    --How many total authors are in the first through third grades?
    select COUNT(Id) FirstThruThirdGraders from Author
	    where Author.GradeId = 3 or Author.GradeId = 2 or Author.GradeId = 1;

    --What is the total number of poems written by fourth graders?
    select COUNT(Title) PoemsBy4thGraders from Poem
	    left join Author on Poem.AuthorId = Author.Id
	    where Author.GradeId = 4;

    --How many poems are there per grade?
    select COUNT(*) PoemsWritten, Grade.Name Class from Poem
	    join Author on Poem.AuthorId = Author.Id
	    join Grade on Author.GradeId = Grade.Id
	    group by Grade.Name;

    --How many authors are in each grade? (Order your results by grade starting with 1st Grade)
    select COUNT(*) Writers, Grade.Name Class from Author
	    join Grade on Author.GradeId = Grade.Id
	    group by Grade.Name;

    --What is the title of the poem that has the most words?
    select top 1 Poem.Title from Poem
	    order by Poem.WordCount desc;

    --Which author(s) have the most poems? (Remember authors can have the same name.)
    select top 5 count(*) as NumberOfPoems, author.id AuthorId, author.Name
	    from poem 
	    left join author on author.id = poem.AuthorId
	    group by author.id, author.name
	    order by NumberOfPoems desc

    --How many poems have an emotion of sadness?
    select COUNT(*) from Poem
	    left join PoemEmotion on Poem.id = PoemEmotion.PoemId
	    where PoemEmotion.EmotionId = 3;

    --How many poems are not associated with any emotion?
    select COUNT(*) NoEmotionPoems from Poem
	    left join PoemEmotion on Poem.id = PoemEmotion.PoemId
	    where PoemEmotion.EmotionId is NULL;

    --Which emotion is associated with the least number of poems?


    --Which grade has the largest number of poems with an emotion of joy?


    --Which gender has the least number of poems with an emotion of fear?