// Default empty project template
import bb.cascades 1.0

// creates one page with a label
Page {
    id: mainPage
    
    property int downX
    property int downY
    
    Container {
        background: Color.LightGray
        leftPadding: 20
        topPadding: 20
        Label {
        	id: labelDown
        	text: "down"
        }
        Label {
        	id: labelUp
        	text: "up"
        }
        Label {
        	id: labelMove
        	text: "move"
        }
        Label {
        	id: labelCancel
        	text: "cancel"
        }
        Label {
            id: labelX
            text: "X"
        }
        Label {
            id: labelY
            text: "Y"
        }
        Label {
            id: labelSwipe
            text: "nothing..."
        }
        onTouch: {
            if(event.isDown()) {
                labelDown.text = "down: true";
                labelUp.text = "up: false";
                labelMove.text = "move: false";
                labelCancel.text = "cancel: false";
                labelSwipe.text = "nothing...";
                mainPage.downX = event.windowX;
                mainPage.downY = event.windowY;
                labelX.text = "X: " + mainPage.downX;
                labelY.text = "Y: " + mainPage.downY;
            } else if(event.isUp()) {
                labelDown.text = "down: false";
                labelUp.text = "up: true";
                labelMove.text = "move: false";
                labelCancel.text = "cancel: false";
                
                var diffX = event.windowX - mainPage.downX;
                var diffY = event.windowY - mainPage.downY;
                
                if(Math.abs(diffX) < 200) {
                    if(diffY > 300) {
                        labelSwipe.text = "Swipe down!"
                    } else if(diffY < -300) {
                        labelSwipe.text = "Swipe up!"
                    } else {
                        labelSwipe.text = "not enough for a swipe..."
                    }
                    setTimeout(function() {
                        labelSwipe.text = "nothing..."
                    }, 1000);
                }
            } else if(event.isMove()) {
                labelDown.text = "down: false"
                labelUp.text = "up: false"
                labelMove.text = "move: true"
                labelCancel.text = "cancel: false"
                labelSwipe.text = "moving...";
            } else if(event.isCancel()) {
                labelDown.text = "down: false"
                labelUp.text = "up: false"
                labelMove.text = "move: false"
                labelCancel.text = "cancel: true"
                labelSwipe.text = "touch cancelled!";
            }
        }
    }
}

