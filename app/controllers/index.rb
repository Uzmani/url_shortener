get '/' do
  erb :index
end

post '/urls' do
   @url_to_be_shortened = Url.new(click_count: 0, long_url: params[:long], end_url: SecureRandom.hex(3))
   if @url_to_be_shortened.save  
     @original_url = @url_to_be_shortened.long_url
     @generated_url = @url_to_be_shortened.end_url
   else
    p "Help, I'm saving too much"
    @errors = @url_to_be_shortened.errors
    redirect "/"
   end
    erb :display_short_url
end 


get '/:short_url' do
  current_url = Url.find_all_by_end_url(params[:short_url]).first
  count = current_url.click_count
  count += 1
  current_url.update_attributes(click_count: count)
  original_url = current_url.long_url
  redirect original_url  
end
