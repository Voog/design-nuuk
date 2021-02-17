<div class="comment_form{% unless comment.valid? %} form_with_errors{% endunless %}">
  {% commentform %}
    {% assign comment_name_error = false %}
    {% assign comment_email_error = false %}
    {% assign comment_body_error = false %}
    {% unless comment.valid? %}
        {% for error in comment.errors %}
            {% if error == "comment_author_blank" %}{% assign comment_name_error = true %}{% endif %}
            {% if error == "comment_email_blank" %}{% assign comment_email_error = true %}{% endif %}
            {% if error == "comment_body_blank" %}{% assign comment_body_error = true %}{% endif %}
        {%endfor %}
    {% endunless %}

    <div class="form_area">
      <div class="form_fields">
        <div class="form_field-wrap">
          <div class="form_field{% if comment_name_error %} form_field_with_errors{% endif %}">
            <label class="form_field_label" for="comment_form-name">{{ "name" | lc }}</label>
            <input id="comment_form-name" class="form_field_textfield form_field_size_small" name="comment[author]" value="{{ comment.author }}">
          </div>
          {% if comment_name_error %}<div class="form_field_error">{{ "comment_author_blank" | lc }}</div>{% endif %}
        </div>

        <div class="form_field-wrap">
          <div class="form_field{% if comment_email_error %} form_field_with_errors{% endif %}">
            <label class="form_field_label" for="comment_form-email">{{ "email" | lc }}</label>
            <input type="email" id="comment_form-email" class="form_field_textfield form_field_size_small" name="comment[author_email]" value="{{ comment.author_email }}">
          </div>
          {% if comment_email_error %}<div class="form_field_error">{{ "comment_email_blank" | lc }}</div>{% endif %}
        </div>

        <div class="form_field-wrap">
          <div class="form_field{% if comment_body_error %} form_field_with_errors{% endif %}">
            <label class="form_field_label" for="comment_form-body">{{ "comment" | lc }}</label>
            <textarea id="comment_form-body" class="form_field_textarea form_field_size_medium" name="comment[body]" rows="5">{{ comment.body }}</textarea>
          </div>
          {% if comment_body_error %}<div class="form_field_error">{{ "comment_body_blank" | lc }}</div>{% endif %}
        </div>
      </div>

      <div class="form_submit">
        <input type="submit" value="{{ "submit" | lc }}">
      </div>
    </div>
  {% endcommentform %}
</div>
