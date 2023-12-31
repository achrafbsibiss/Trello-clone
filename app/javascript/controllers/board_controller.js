import { Controller } from '@hotwired/stimulus'
import axios from 'axios'

export default class extends Controller {
    HEADERS = { 'ACCEPT': 'application/json' }
    connect() {
      axios.get('/api/boards/1/lists', { headers: this.HEADERS } ).then((response) => {
        console.log('list response: ', response);
      });
      const boards =[
        {
            "id"    : "board-id-1",
            "title" : "To DO",
            "class" : "bg-red-700, text-white",
            "item"  : [
                {
                    "id"      : "item-id-1",
                    "title"   : "Item 1",
                    "username": "username1"
                },
                {
                    "id"      : "item-id-2",
                    "title"   : "Item 2",
                    "username": "username2"
                }
            ]
        },

        {
            "id"    : "board-id-2",
            "title" : "Work IN",
            "class" : "bg-blue-700, text-white",
            "item"  : [
                {
                    "id"      : "item-id-1",
                    "title"   : "Item 1",
                    "username": "username1"
                },
                {
                    "id"      : "item-id-2",
                    "title"   : "Item 2",
                    "username": "username2"
                }
            ]
        },
        {
            "id"    : "board-id-3",
            "title" : "finish",
            "class" : "bg-green-700, text-white",
            "item"  : [
                {
                    "id"      : "item-id-1",
                    "title"   : "Item 1",
                    "username": "username1"
                },
                {
                    "id"      : "item-id-2",
                    "title"   : "Item 2",
                    "username": "username2"
                }
            ]
        }
      ]
      var kanban = new jKanban({
        element          : '#board',                                           // selector of the kanban container
        boards           : boards,                                           // json of boards
        itemAddOptions: {
            enabled: false,                                              // add a button to board for easy item creation
            content: '+',                                                // text or html content of the board button   
            class: 'kanban-title-button btn btn-default btn-xs',         // default class of the button
            footer: false                                                // position the button on footer
        },    
        itemHandleOptions: {
            enabled             : false,                                 // if board item handle is enabled or not
            handleClass         : "item_handle",                         // css class for your custom item handle
            customCssHandler    : "drag_handler",                        // when customHandler is undefined, jKanban will use this property to set main handler class
            customCssIconHandler: "drag_handler_icon",                   // when customHandler is undefined, jKanban will use this property to set main icon handler class. If you want, you can use font icon libraries here
            customHandler       : "<span class='item_handle'>+</span> %title% "  // your entirely customized handler. Use %title% to position item title 
                                                                                 // any key's value included in item collection can be replaced with %key%
        },
        click            : function (el) {},                             // callback when any board's item are clicked
        context          : function (el, event) {},                      // callback when any board's item are right clicked
        dragEl           : function (el, source) {},                     // callback when any board's item are dragged
        dragendEl        : function (el) {},                             // callback when any board's item stop drag
        dropEl           : function (el, target, source, sibling) {},    // callback when any board's item drop in a board
        dragBoard        : function (el, source) {},                     // callback when any board stop drag
        dragendBoard     : function (el) {},                             // callback when any board stop drag
        buttonClick      : function(el, boardId) {},                     // callback when the board's button is clicked
        propagationHandlers: [],                                         // the specified callback does not cancel the browser event. possible values: "click", "context"
    });
      console.log('kanban', kanban)
    }
}