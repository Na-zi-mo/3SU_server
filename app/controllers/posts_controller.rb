class PostsController < ApplicationController

    def mathieu
      debugger
      render html: "<h1>Yo </h1>"
    end

    def index
      # debugger
        @posts = Post.all
        respond_to do |format|
          format.html
          format.json { render :json => @posts.to_json }
          format.xml { render :xml => @posts.as_json.to_xml }
        end
    end

    def show
      @post = Post.find(params[:id])
      respond_to do |format|
        format.html
        format.json { render :json => @post.to_json }
        format.xml { render :xml => @post.as_json.to_xml }
      end
    end

    def new
        @post = Post.new
    end

    def publish
      @post = Post.find(params[:id])
      @post.update(published: true)
      redirect_to posts_path
    end

    def unpublish
      @post = Post.find(params[:id])
      @post.update(published: false)
      redirect_to posts_path
    end

    def edit
        @post = Post.find(params[:id])
    end

    def create
        # Securite lors d'une assignation de masse, on filtre les paramètres authoriser avant de les envoyer au modèle qui gère la base de données
        # Voir fonction privé de ce controlleur
        #post_params = params.require(:post).permit(:title, :body)
        

        @post = Post.new(post_params)
        
        respond_to do |format|    
          if @post.save # Si la sauvegarde se passe bien, on redirige vers l'action index_5 pour rafraichir le formulaire
            format.html {redirect_to '/posts'}
          else
            format.html {render 'new' } # Si une erreur arrive, on l'affiche sur le formulaire d'origine
          end
          # Si utilisation en javascript
          format.json { render :json => @post.to_json }
          format.xml { render :xml => @post.as_json.to_xml }
        end
    end

    def update
        # Securite lors d'une assignation de masse, on filtre les paramètres authoriser avant de les envoyer au modèle qui gère la base de données
        # Voir fonction privé de ce controlleur
        #post_params = params.require(:post).permit(:title, :body)

        @post = Post.find(params[:id])        
        
        respond_to do |format|    
          if @post.update(post_params) # Si la sauvegarde se passe bien, on redirige vers l'action index_5 pour rafraichir le formulaire
            format.html {redirect_to '/posts'}
          else
            format.html {render 'edit' } # Si une erreur arrive, on l'affiche sur le formulaire d'origine
          end
          # Si utilisation en javascript
          format.json { render :json => @post.to_json }
          format.xml { render :xml => @post.as_json.to_xml }
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :body, :page_id)
    end
end
