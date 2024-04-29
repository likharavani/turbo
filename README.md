# README

Hotwire is not a single framework; it’s a suite of different frameworks.

1. Turbo uses different techniques to reduce the amount of JavaScript most web applications have to write. This is the most important part of Hotwire.

2. Stimulus is a JavaScript framework when you absolutely need to use JavaScript. It sprinkles the client-side interactivity for your application when a server-side trip is not justified.

When creating a new article or comments only update section is changed and rest of remains unchanged this is because of we use turbo-frame and turbo-stream in the whole application. 

And for stimulus 

1. When user click on particular article name the alert box is open in which we use stimulus js, for this we add controller user_click inside the javascript.

2. When user check the check-box then its state is updated using the stimulus js, for this we add controller user_toggle inside the javascript.

Response

You can see the response like only frames are updated not the whole page renders using terminal or in network tab 
