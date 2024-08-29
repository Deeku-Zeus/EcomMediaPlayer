I have created a project called EcomMediaPlayer

the problem statement behind it was

Many users often find themselves pausing videos, movies, or series to take photos of items they find attractive, only to struggle with finding those items or related products in the marketplace. This process is time-consuming and often leads to frustration. Our idea aims to seamlessly integrate e-commerce with media consumption, providing users with an effortless shopping experience based on the content they watch.


So, I have created a media player that has a crop feature embedded into the controls of the video. when the user feels like there is something interesting on the frame and wants to know more about it, he would click on the crop icon. doing so, would pause the video and he would be able to select a region on the frame. soon after he does that, this image would be sent to a backend system. here, the image would be saved for future reference. and the backend system now relays it to a ML System ( you could suggest a name here if you feel it's not accurate). In the ML System, the image would be processed and a trained model would classify the contents of the image. once done, the details are sent back to the Backend System.
Now, the Backend system would generate a token (like a request id) along with the list of classified objects detected my the ML system and send it to the Frontend system ( where the video player is).
meanwhile, the backend system would start a search on Ecommerce Sites for products matching the classification tags. Once found, it would set a flag true to ensure the search is complete. the frontend on the other hand would use that request id shared and keeps calling the backend system to check on the results of ecommerce search.
once received, it shares the results back to the frontend.

The video player also has a side panel embedded within it. the user can view the side panel to see the list of items he had searched for with the links to the ecommerce site if found.


Technical details,
we have a total of 5 components here
- Frontend Component - setup in svelte and tailwind css
- Backend Component - setup in Laravel
- Database component - setup with MySQL
- EcomAPI component -  a system setup in laravel to act like a component that provides ecommerce search results. it would share the file location of a product image that matches the classification tag sent by the backend system
- VideoAnalyser - setup in Flask and has pretrained models that taken in image and provides the classification tags


Now, here are some more details on how this was architectured.
i have containerized Frontend Component, Backend Component, Database Component and EcomAPI component.
the videoAnalyser on the other hand runs on the host system to ensure more computing power is available.