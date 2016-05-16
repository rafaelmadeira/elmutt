module Card exposing (Model, Msg, model, view, update)

import Html exposing (Html, div, input, button, h3, h6, text, p, i, h4, span, ul, li)
import Html.Attributes exposing (class, value, type', disabled)
import Html.Events exposing (onInput, onClick)


type alias Model =
    { counter : Int, text : String, isEditingText : Bool }


model : Model
model =
    Model 0 "Text" False


type Msg
    = Increment
    | Decrement
    | StartEditingText
    | FinishEditingText
    | TextChanged String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | counter = model.counter + 1 }

        Decrement ->
            { model | counter = model.counter - 1 }

        StartEditingText ->
            { model | isEditingText = True }

        TextChanged newText ->
            { model | text = newText }

        FinishEditingText ->
            { model | isEditingText = False }


view : Model -> Html Msg
view model =
    div [ class "mdl-cell mdl-cell--4-col mdl-card mdl-shadow--2dp" ]
        [ div [ class "mdl-card__title mdl-card--expand" ]
            [ if model.isEditingText then
                input [ type' "text", onInput TextChanged, value model.text ] []
              else
                p [ onClick StartEditingText ] [ text model.text ]
            ]
        , div [ class "mdl-card__actions mdl-card--border" ]
            [ if model.isEditingText then
                button [ class "mdl-button mdl-js-button mdl-button--icon", onClick FinishEditingText ]
                    [ i [ class "material-icons" ] [ text "done" ] ]
              else
                button [ class "mdl-button mdl-js-button mdl-button--icon", onClick StartEditingText ]
                    [ i [ class "material-icons" ] [ text "short_text" ] ]
            , button [ class "mdl-button mdl-js-button mdl-button--icon", onClick Increment ]
                [ i [ class "material-icons" ] [ text "add" ] ]
            , button [ class "mdl-button mdl-js-button mdl-button--icon", onClick Decrement ]
                [ i [ class "material-icons" ] [ text "remove" ] ]
            , button [ class "mdl-button mdl-js-button mdl-button--icon", onClick Decrement ]
                [ i [ class "material-icons" ] [ text "clear" ] ]
            , span [ class "mdl-layout-spacer" ] [ text "    " ]
            , button [ class "mdl-button mdl-js-button mdl-button--icon", disabled True ]
                [ span [ class "mdl-color-text--accent" ] [ text (toString model.counter) ] ]
            ]
        ]
